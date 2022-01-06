Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBD1486603
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 15:27:54 +0100 (CET)
Received: from localhost ([::1]:51500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Tk9-0008Ov-Jj
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 09:27:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5TGJ-0004hB-Bs
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:57:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5TGH-0002Qo-Ju
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 08:57:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641477419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UncPi/vrDQTvd0vKZfvdjxNQGeZZla6kywlULdA2M8M=;
 b=DVW3weEd+tyvZf4pwUz23PmklMY5OdxX05Xdo8cjGXYq2kSZRw4IHbq/zFWa14mMbL3ZdC
 eE5NXfwy35FNNIw06v0dVOO6r045oHtTAaOoLds7ORlP8fg42n1L5bnreit+a96hswx3E2
 Nm9kXHd2Bpm4o0B+HfZQuxi4TWhh6Jo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-79-O6NbDqYTMzCIdVNZqvBluw-1; Thu, 06 Jan 2022 08:56:51 -0500
X-MC-Unique: O6NbDqYTMzCIdVNZqvBluw-1
Received: by mail-wr1-f72.google.com with SMTP id
 s30-20020adfa29e000000b001a25caee635so1282349wra.19
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 05:56:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=UncPi/vrDQTvd0vKZfvdjxNQGeZZla6kywlULdA2M8M=;
 b=ia8cEPxrRhloMYsr3szPT/s9sIuI06K+VKZV3GZvZaXpvl0RFnMY8hGgEoUjo4wEeI
 32Mjc7oL+mATVhCARYAp70e9xOsYvaB0E8esu4WO+pjKur0mcOh+dumZKk9o2cocZIdv
 2eXbOyCTDz3VuOVMPK8/Uh5G+LUasuG3yXVdoSoO32y2OlddLPfcl9Y+rpUV0icGaznh
 5lzY1FnPwJrVm1MAoAzQgdcKiwuByq021dsJJZvXhOjt/3QXG7mOmLiAw60R/XRvfcHY
 LqAsWWQ6HOQiaae5GzVlKr1DUUdrLWeAQDuCxb5BShZh2BqVTPOrElbTdBtLE9z7jCir
 cjOg==
X-Gm-Message-State: AOAM530eDsH13KKrNjDFnd3xLEqNnXtMmjLhhXoL2zD7qBzntiz4gTRY
 sP7+x/NDZP5yLDRkOy6uCa6nOVhg7MiiROyBgbJXJfy31NTDMh8xXzyEhdqgnlQCymgTkGJPhOG
 aCz9g6Joc8El6GBM=
X-Received: by 2002:a5d:64aa:: with SMTP id m10mr52594841wrp.500.1641477410244; 
 Thu, 06 Jan 2022 05:56:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwo01iIVyFQqTkaqgCeGeHf0StfUq2nsos1SSWPAGX8JUrxb9hMDKP13PjX3K5OCO1L0/N3Kw==
X-Received: by 2002:a5d:64aa:: with SMTP id m10mr52594831wrp.500.1641477410044; 
 Thu, 06 Jan 2022 05:56:50 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id q14sm2105165wro.58.2022.01.06.05.56.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 05:56:49 -0800 (PST)
Date: Thu, 6 Jan 2022 08:56:46 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH v5 2/3] acpi: tpm: Add missing device identification
 objects
Message-ID: <20220106085502-mutt-send-email-mst@kernel.org>
References: <20220104175806.872996-1-stefanb@linux.ibm.com>
 <20220104175806.872996-3-stefanb@linux.ibm.com>
 <20220106093636.7fc7755f@redhat.com>
 <6096f301-4c39-e39c-eb5f-9f7d22ba1260@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <6096f301-4c39-e39c-eb5f-9f7d22ba1260@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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
Cc: Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-devel@nongnu.org,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 06, 2022 at 08:53:00AM -0500, Stefan Berger wrote:
> 
> On 1/6/22 03:36, Igor Mammedov wrote:
> > On Tue,  4 Jan 2022 12:58:05 -0500
> > Stefan Berger <stefanb@linux.ibm.com> wrote:
> > 
> > > Add missing TPM device identification objects _STR and _UID. They will
> > > appear as files 'description' and 'uid' under Linux sysfs.
> > > 
> > > Following inspection of sysfs entries for hardware TPMs we chose
> > > uid '1'.
> > My guess would be that buy default (in case of missing UID), OSPM
> > will start enumerate from 0. So I think 0 is more safer choice
> > when it comes to compatibility.
> > 
> > Can you smoke test TPM with Windows, and check if adding UID doesn't
> > break anything if VM actually uses TMP (though I'm not sure how to
> > check it on Windows, maybe install Windows 11 without this patch
> > and then see if it still boots pre-installed VM and nothing is broken
> > after this patch)?
> > 
> I smoke tested it with the posted patches applied to v6.2.0 and started 3
> VMs with it:
> 
> - Linux shows uid = 1 and the description "TPM 2.0 Device" in sysfs
> 
> - Win 10 and Win 11 tpm.msc tool are both showing that the TPM is 'ready for
> use'
> 
>     Stefan
> 

Just to make sure, what Igor was concerned about is issues like
we had with e.g. network devices, when changing UID makes
windows think it's a new device and lose configuration
created on old qemu on boot with a new qemu.
Not sure what can be configured with a TPM device though ...

-- 
MST


