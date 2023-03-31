Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 396276D19B1
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Mar 2023 10:22:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1piA0o-0001wk-0K; Fri, 31 Mar 2023 04:21:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1piA0k-0001wW-VX
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 04:21:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1piA0j-0000sz-3m
 for qemu-devel@nongnu.org; Fri, 31 Mar 2023 04:21:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680250883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mrLzS9aXTCNI2kPymDBaB9weApO4J1V/ZRhbbCvldvM=;
 b=FQMTcI3TIW3DRrq0feKp4pjRD/pFr9inaxxPK0mgaF3Ac8CWDUJXbBWAqro3u3MKBy2uBX
 v38xLjXWpe5hrAriBLJ1uQP12Vwl1E9VsWySu4zFnBohvJZxy92H7mskHAeFrce67P4n2p
 jXPn1Ct8tqBB+Y8uOn0ocfpOVEdMJVY=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-116-r-tr7KDbNKO9gMjiBzeHHQ-1; Fri, 31 Mar 2023 04:21:21 -0400
X-MC-Unique: r-tr7KDbNKO9gMjiBzeHHQ-1
Received: by mail-oa1-f70.google.com with SMTP id
 586e51a60fabf-17a678c2de9so11082508fac.14
 for <qemu-devel@nongnu.org>; Fri, 31 Mar 2023 01:21:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680250880; x=1682842880;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mrLzS9aXTCNI2kPymDBaB9weApO4J1V/ZRhbbCvldvM=;
 b=ZOAgNxWESlq2lSCsDOnJuuPCK0j3c4IFbody5K0QpZosTX+1JX9slk3N8Zml7dRWll
 BLRYCjC8X+DsAXACI5NyYTxXllwYXOkGQZgV8Z0ux2peyjLVHo7kOxLCxJ4R16UvJvMi
 /eQmNpAATTiv99bVaN9uZM2UPHjyv3qpod6xTDqys1J1UoP2j6vbbcCOBsuNw7gtPGUJ
 8dUs7oVAJ4W+pOfFHrg33Sg70k0JIHFQZPWW4CSyR2ikXyC+2ZLTDJfULSDUcfVbzj2c
 C2LdCcAWa3wBrPeVTsR5ebFE68zR7m9t/Rh0w92RJ9FRPD9x7lTc8gp8W5sJc8UvJyrI
 h8Mg==
X-Gm-Message-State: AAQBX9epeZkS5wVn6dfg8oAmKHl+xHprzRqSBpW4KO64rw+5sJ7hQxsv
 aEM1LAqUFoftzwH1ElpTfrqWQ59ptWFDvKyXE/ZrUEvfWSvjFkIGqzLtSxAvdJDlwrFcra6YtyX
 Q8Qy+gy59Q7q5dsOO43Z0mvtOOOjBYHQ=
X-Received: by 2002:a05:6808:9bb:b0:389:86c3:b1fb with SMTP id
 e27-20020a05680809bb00b0038986c3b1fbmr1075230oig.9.1680250880694; 
 Fri, 31 Mar 2023 01:21:20 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y9Irpw4o7sSiJwP3g/+9OeEgxhUfj3DD5ijgTjCuAXKbTV+bm4P3NTau1wBFvLJl1vdT9QJIavSaRrhKb4xS4=
X-Received: by 2002:a05:6808:9bb:b0:389:86c3:b1fb with SMTP id
 e27-20020a05680809bb00b0038986c3b1fbmr1075217oig.9.1680250880470; Fri, 31 Mar
 2023 01:21:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230330001522.120774-1-andrew@daynix.com>
 <20230330001522.120774-4-andrew@daynix.com>
 <CACGkMEs1hRNLL67W96MO3eMg4H=ex4bYvFxcUkNPgfXXbOvo3A@mail.gmail.com>
 <ZCVJoi7YQlt3axba@redhat.com>
 <CACGkMEugLOsQJz_Hie1-0WLbPEiC2B_7y=RVqqmGi8-aqBfHXQ@mail.gmail.com>
 <ZCaSzxCmqtec/Vin@redhat.com>
 <CACGkMEuMgbxci4LLrmSqth73Mv8kriHX42=y==26mJPFHMzRLA@mail.gmail.com>
 <ZCaWLehDbWTAJtIi@redhat.com>
In-Reply-To: <ZCaWLehDbWTAJtIi@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 31 Mar 2023 16:21:09 +0800
Message-ID: <CACGkMEutODVu76qmVM9XyY=dCbx=3RHFF2b8phEVp+7buQRr6g@mail.gmail.com>
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

On Fri, Mar 31, 2023 at 4:13=E2=80=AFPM Daniel P. Berrang=C3=A9 <berrange@r=
edhat.com> wrote:
>
> On Fri, Mar 31, 2023 at 04:03:39PM +0800, Jason Wang wrote:
> > On Fri, Mar 31, 2023 at 3:59=E2=80=AFPM Daniel P. Berrang=C3=A9 <berran=
ge@redhat.com> wrote:
> > >
> > > On Fri, Mar 31, 2023 at 03:48:18PM +0800, Jason Wang wrote:
> > > > On Thu, Mar 30, 2023 at 4:34=E2=80=AFPM Daniel P. Berrang=C3=A9 <be=
rrange@redhat.com> wrote:
> > > > >
> > > > > On Thu, Mar 30, 2023 at 02:54:32PM +0800, Jason Wang wrote:
> > > > > > On Thu, Mar 30, 2023 at 8:33=E2=80=AFAM Andrew Melnychenko <and=
rew@daynix.com> wrote:
> > > > > >
> > > > > > Who or how the ABI compatibility is preserved between libvirt a=
nd Qemu?
> > > > >
> > > > > There's no real problem with binary compatibility to solve any mo=
re.
> > > > >
> > > > > When libvirt first launches a QEMU VM, it will fetch the eBPF pro=
grams
> > > > > it needs from that running QEMU using QMP. WHen it later needs to
> > > > > enable features that use eBPF, it already has the program data th=
at
> > > > > matches the running QEMU
> > > >
> > > > Ok, then who will validate the eBPF program? I don't think libvirt =
can
> > > > trust what is received from Qemu otherwise arbitrary eBPF programs
> > > > could be executed by Qemu in this way. One example is that when gue=
sts
> > > > escape to Qemu it can modify the rss_bpf__elf_bytes. Though
> > > > BPF_PROG_TYPE_SOCKET_FILTER gives some of the restrictions, we stil=
l
> > > > need to evaluate side effects of this. Or we need to find other way=
s
> > > > like using the binary in libvirt or use rx filter events.
> > >
> > > As I mentioned, when libvirt first launches QEMU it will fetch the
> > > eBPF programs and keep them for later use. At that point the guest
> > > CPUs haven't started running, and so QEMU it still sufficiently
> > > trustworthy.
> >
> > Well, this means the QMP command is safe only before Qemu starts to
> > run VCPU. I'm not sure this is a good design. Or at least we need to
> > fail the QMP command if VCPU starts to run.
>
> Currently QEMU has the ability to just create the eBPF programs itself
> at will, when it is launched in a privileged scenario regardless of
> guest CPU state. In terms of QMP, the reporting of QEMU PIDs for its
> various vCPU, I/O threads is also not to be trusted after vCPU starts
> if the guest workload is not trustworthy.

Indeed.

> I feel this is more of docs
> problem to explain the caveats that apps should be aware of.

Ok, we can probably document this and in the future we probably need
to address them.

Thanks

>
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


