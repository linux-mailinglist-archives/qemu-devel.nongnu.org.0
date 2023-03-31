Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5CE6D1948
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 10:04:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pi9jr-00057V-67; Fri, 31 Mar 2023 04:03:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pi9jo-00057D-AR
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 04:03:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pi9jm-00039N-MX
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 04:03:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680249833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9NmPE5Jq62qE89ZzPMkSx44IPjv/qhP8BucpGu6mxGE=;
 b=Apuss+RtSXMjQnxMbTHYLwbQTZCXstIdvgvQMvul1eDE/2FfSC1wplr4t4gqTWkpvalZlc
 83rv9JK3B2HxbBTMxKzqJn/2vnFbnVuKeg1k4A1vbWIa4aCQauZYwuz8iToWSgfqW80giY
 HMQYQtg8nKSuGLjcRGnwX9nAXPElVRE=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-512-FEcAjLqAOA6MsxAqDkfJrg-1; Fri, 31 Mar 2023 04:03:51 -0400
X-MC-Unique: FEcAjLqAOA6MsxAqDkfJrg-1
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-17fd0d597dcso3715427fac.6
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 01:03:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680249830; x=1682841830;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9NmPE5Jq62qE89ZzPMkSx44IPjv/qhP8BucpGu6mxGE=;
 b=5fJWZStxdxh8RmEDYFyowQb5e4BgeAMrBxKrj6ztkL++jYkKU5dfMMauyMnmJXOWZP
 I+U0EiQQU3asT9kGnEqPLIn4Zm4xVmSNJlZMKBIlXlnNX4VM+x1K+oj9tmkmlaja3fir
 klGRruIwwFPgeEwUZ5PabhXx121BEFIqLRNBzJPAZeGRNj3MMC+kOYVXyWEKaIaMk4oV
 TTGMClzMbw9XZC5cEwRDWjgKVY9d8Dy/6EsicmlKXSbC2g+Mj8C3pVzMHskTouToFxow
 a6+j2n9KX4P4ZGONfGz0liKav7p3lMTZuaV2koyZnS6Pcf8161ibre0kWwjbjKrDa4Mg
 FXYw==
X-Gm-Message-State: AAQBX9ffRfzVVFuh5gk6RL86GWLDn+1XOgF6Vmbk+gm5aEXBF7Ogr8u+
 G29oRnFHeONDQBXTEyfFOOFbbmNZfLEniPiuE1B1cR+0HOukCxiHJK9GanB1PaxAVjn1cou8ThX
 QYStTU1koY89wGxOHhgZay4kL4lvHupI=
X-Received: by 2002:a05:6871:4d03:b0:17d:1287:1b5c with SMTP id
 ug3-20020a0568714d0300b0017d12871b5cmr9177862oab.9.1680249830638; 
 Fri, 31 Mar 2023 01:03:50 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z1VkjjYynTL490nqfubRNQRgb1n6wUbdolVFnwAnHQ1ppR3BcZzSf3gmPaNISiV1+PEV1VmkGN8R8KikWvW5s=
X-Received: by 2002:a05:6871:4d03:b0:17d:1287:1b5c with SMTP id
 ug3-20020a0568714d0300b0017d12871b5cmr9177842oab.9.1680249830407; Fri, 31 Mar
 2023 01:03:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230330001522.120774-1-andrew@daynix.com>
 <20230330001522.120774-4-andrew@daynix.com>
 <CACGkMEs1hRNLL67W96MO3eMg4H=ex4bYvFxcUkNPgfXXbOvo3A@mail.gmail.com>
 <ZCVJoi7YQlt3axba@redhat.com>
 <CACGkMEugLOsQJz_Hie1-0WLbPEiC2B_7y=RVqqmGi8-aqBfHXQ@mail.gmail.com>
 <ZCaSzxCmqtec/Vin@redhat.com>
In-Reply-To: <ZCaSzxCmqtec/Vin@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 31 Mar 2023 16:03:39 +0800
Message-ID: <CACGkMEuMgbxci4LLrmSqth73Mv8kriHX42=y==26mJPFHMzRLA@mail.gmail.com>
Subject: Re: [RFC PATCH 3/5] ebpf: Added declaration/initialization routines.
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Andrew Melnychenko <andrew@daynix.com>, mst@redhat.com, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, thuth@redhat.com, philmd@linaro.org, 
 armbru@redhat.com, eblake@redhat.com, qemu-devel@nongnu.org, toke@redhat.com, 
 mprivozn@redhat.com, yuri.benditovich@daynix.com, yan@daynix.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, Mar 31, 2023 at 3:59=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrange@r=
edhat.com> wrote:
>
> On Fri, Mar 31, 2023 at 03:48:18PM +0800, Jason Wang wrote:
> > On Thu, Mar 30, 2023 at 4:34=E2=80=AFPM Daniel P. Berrang=C3=A9 <berran=
ge@redhat.com> wrote:
> > >
> > > On Thu, Mar 30, 2023 at 02:54:32PM +0800, Jason Wang wrote:
> > > > On Thu, Mar 30, 2023 at 8:33=E2=80=AFAM Andrew Melnychenko <andrew@=
daynix.com> wrote:
> > > >
> > > > Who or how the ABI compatibility is preserved between libvirt and Q=
emu?
> > >
> > > There's no real problem with binary compatibility to solve any more.
> > >
> > > When libvirt first launches a QEMU VM, it will fetch the eBPF program=
s
> > > it needs from that running QEMU using QMP. WHen it later needs to
> > > enable features that use eBPF, it already has the program data that
> > > matches the running QEMU
> >
> > Ok, then who will validate the eBPF program? I don't think libvirt can
> > trust what is received from Qemu otherwise arbitrary eBPF programs
> > could be executed by Qemu in this way. One example is that when guests
> > escape to Qemu it can modify the rss_bpf__elf_bytes. Though
> > BPF_PROG_TYPE_SOCKET_FILTER gives some of the restrictions, we still
> > need to evaluate side effects of this. Or we need to find other ways
> > like using the binary in libvirt or use rx filter events.
>
> As I mentioned, when libvirt first launches QEMU it will fetch the
> eBPF programs and keep them for later use. At that point the guest
> CPUs haven't started running, and so QEMU it still sufficiently
> trustworthy.

Well, this means the QMP command is safe only before Qemu starts to
run VCPU. I'm not sure this is a good design. Or at least we need to
fail the QMP command if VCPU starts to run.

Thanks

>
> With regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
>


