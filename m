Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7CB486805
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 17:58:00 +0100 (CET)
Received: from localhost ([::1]:46106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5W5P-0001H5-5y
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 11:57:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1n5W3W-0000H7-2g
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 11:56:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1n5W3P-0000IF-5n
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 11:55:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641488153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U0XUKXczTgb20Dcva/hfrdqXCiUW2rPkIwP4io+TEhE=;
 b=Lq/LlX2nQIqJbIpMvcCAFYPYirH1fZtzCChTZHuBM7NqrP4gupp/XJB8XBSOmayn64h7gH
 L6MuKwQro1ZsrZHEOtejcvU2gFiNiSu88cyKE9mQ3d5FIaxtSFO7DH8oLENCAAE9k5PMLG
 7Htv46BwF9Ca01k3Us4j2n4ewS6wF2c=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-LY5i7YuaMhWsrykD-15bXA-1; Thu, 06 Jan 2022 11:55:50 -0500
X-MC-Unique: LY5i7YuaMhWsrykD-15bXA-1
Received: by mail-ed1-f69.google.com with SMTP id
 w6-20020a05640234c600b003f916e1b615so2390643edc.17
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 08:55:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U0XUKXczTgb20Dcva/hfrdqXCiUW2rPkIwP4io+TEhE=;
 b=cvmJtppCNl/lcgCU/46GFOs4OTIE1xbd5GbWfckl6ithWmQBnzK9vPcOrSJpoyR1W6
 aqyO5gJk1ZVyptPbHQFZkhoGo+XvqcYO5/MH7YRT75EX8uXL8ODviJ6M/XQpTZ7OsnvV
 fVRhr5Otoo1kTjyXNg75geEKKRElzwn9A+e4YtVQSwghfidg8xcO6lIH8wnEte+nuxRp
 JdBGQ6shg9T54ZLO2Rq4ms5b0gGhRBJ6ZCqDBskGMn5l+bnjf8RMqljMid0UGNfyxhGE
 0GHiORwWVR8MX5JTtbwaWTqhg3egSsXyWwHA2gE3YbvwhBFKmsSBIE9sknZp/hUsxjIH
 pLfA==
X-Gm-Message-State: AOAM532Nz7RTEbC0QsB2w0m/3kKMCJ23qVDU+pNVPOh3s1HbdJYq1694
 TgtKBbHTnk1kdNTYSyvaGDKsJxdFeAulD7XdIxAs1IMXv6GDprFkaGJRT/Ho3I/h33YEL4FJEvg
 HNz2vZe+LnWJqUlE=
X-Received: by 2002:a05:6402:3593:: with SMTP id
 y19mr57330070edc.25.1641488149625; 
 Thu, 06 Jan 2022 08:55:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJytBQ+lcxv+63Sa2D3eNyIrFOJuiMMnFd/UdrSreutSr+64aAdOrc3x7V/hJJKCglI/iV+zew==
X-Received: by 2002:a05:6402:3593:: with SMTP id
 y19mr57330052edc.25.1641488149421; 
 Thu, 06 Jan 2022 08:55:49 -0800 (PST)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id b2sm617512ejh.199.2022.01.06.08.55.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 08:55:48 -0800 (PST)
Date: Thu, 6 Jan 2022 17:55:47 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH v5 2/3] acpi: tpm: Add missing device identification
 objects
Message-ID: <20220106175547.6b5b8639@redhat.com>
In-Reply-To: <bc4b7631-6bf5-ce30-8710-48f0369f688c@linux.ibm.com>
References: <20220104175806.872996-1-stefanb@linux.ibm.com>
 <20220104175806.872996-3-stefanb@linux.ibm.com>
 <20220106093636.7fc7755f@redhat.com>
 <6096f301-4c39-e39c-eb5f-9f7d22ba1260@linux.ibm.com>
 <20220106085502-mutt-send-email-mst@kernel.org>
 <bc4b7631-6bf5-ce30-8710-48f0369f688c@linux.ibm.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Ani Sinha <ani@anisinha.ca>, marcandre.lureau@redhat.com,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 6 Jan 2022 09:01:36 -0500
Stefan Berger <stefanb@linux.ibm.com> wrote:

> On 1/6/22 08:56, Michael S. Tsirkin wrote:
> > On Thu, Jan 06, 2022 at 08:53:00AM -0500, Stefan Berger wrote: =20
> >> On 1/6/22 03:36, Igor Mammedov wrote: =20
> >>> On Tue,  4 Jan 2022 12:58:05 -0500
> >>> Stefan Berger <stefanb@linux.ibm.com> wrote:
> >>> =20
> >>>> Add missing TPM device identification objects _STR and _UID. They wi=
ll
> >>>> appear as files 'description' and 'uid' under Linux sysfs.
> >>>>
> >>>> Following inspection of sysfs entries for hardware TPMs we chose
> >>>> uid '1'. =20
> >>> My guess would be that buy default (in case of missing UID), OSPM
> >>> will start enumerate from 0. So I think 0 is more safer choice
> >>> when it comes to compatibility.
> >>>
> >>> Can you smoke test TPM with Windows, and check if adding UID doesn't
> >>> break anything if VM actually uses TMP (though I'm not sure how to
> >>> check it on Windows, maybe install Windows 11 without this patch
> >>> and then see if it still boots pre-installed VM and nothing is broken
> >>> after this patch)?
> >>> =20
> >> I smoke tested it with the posted patches applied to v6.2.0 and starte=
d 3
> >> VMs with it:
> >>
> >> - Linux shows uid =3D 1 and the description "TPM 2.0 Device" in sysfs
> >>
> >> - Win 10 and Win 11 tpm.msc tool are both showing that the TPM is 'rea=
dy for
> >> use'
> >>
> >>  =C2=A0=C2=A0=C2=A0 Stefan
> >> =20
> > Just to make sure, what Igor was concerned about is issues like
> > we had with e.g. network devices, when changing UID makes
> > windows think it's a new device and lose configuration
> > created on old qemu on boot with a new qemu.
> > Not sure what can be configured with a TPM device though ... =20
>=20
> The VMs were all created on an old qemu and booted into the patched=20
> qemu. They hadn't seen the new ACPI entries before, for sure not when=20
> they were installed.=20

In that case I would not bother with compat machinery

(my stance on APCI and compat knobs haven't changed and it
is avoid it if possible, sometimes that backfires but overall
keeps code simpler, otherwise it would be unreadable mess
(it's already complex enough))

Reviewed-by: Igor Mammedov <imammedo@redhat.com>


