Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BCC6CFC15
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 08:58:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phmEL-0002sv-Cf; Thu, 30 Mar 2023 02:57:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1phmEH-0002sT-07
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 02:57:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1phmEF-00016T-En
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 02:57:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680159466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zxRLGKM7jqTPOBcl4keiuSy18AZxhOmSnWDGKo0rHiI=;
 b=Zh/vFdrcRxf4ydTgU9JlnB7KIy7smMbDSTRUwNQGaz9n1tispgg2TJAhwvzDDf5UZKmehy
 Nxuo1+jjhvIRG4eyEoTSZW/azThc0zYGQy31ZhUMPaMDuHF/pukRS8FgQSjXKxxBp1i5K2
 SDZ5P4s9US+dVHJVHFkBg5bz3wcT9r0=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-357-K4cfVJ9KOqCy_iWKC3SDww-1; Thu, 30 Mar 2023 02:57:42 -0400
X-MC-Unique: K4cfVJ9KOqCy_iWKC3SDww-1
Received: by mail-oa1-f69.google.com with SMTP id
 586e51a60fabf-17e7104c589so9471884fac.19
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 23:57:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680159462; x=1682751462;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zxRLGKM7jqTPOBcl4keiuSy18AZxhOmSnWDGKo0rHiI=;
 b=lNjcbYZzPoDaD7v+OIh09w57cZoJD85BUZ1rpjcGiWvuUQatQAdh3OvKX0YXjX9RNo
 hMycY626i56oDXM00xhIzIoCNlmACRweVjCZXRfccCav57s1J/GzS5jHXT5rGLFwFBbM
 NoZ7bIYbb28gxmvl2kYNYkmsnHcgzQQqhzv/+ketUD8y6JnRSJCaU4cjSCFBXs3cUkZT
 sIQvzaQ5WuYRF3uM8RkJteKIRZyFAZxutSKycBVxo+yHeuB7bYOQ6qQzSuyBetx/cyeK
 qV3G5SxGz4nNF66pEDUPHUKiIkAfE29vK9Ef7Jz6E4G25avq6khRbd/9r2LBAmJ2Y+ZS
 sSJg==
X-Gm-Message-State: AO0yUKUCwFskiQBcLPQoJYoyuWJw7XPlR2+j5HwdwlpAo76ZPL6eJ2af
 TOOx5jdaCw/AupCBRmWqnvm7clcKw9ghEVGL2Dnfk0j0a/LIvMIiMfmSdtmf9YrK+moLX/tslLS
 pYCnYThzmSD8N2iO3MAPH3i2/oRQQLgY=
X-Received: by 2002:a9d:6a5a:0:b0:69f:573:6113 with SMTP id
 h26-20020a9d6a5a000000b0069f05736113mr7041208otn.2.1680159462227; 
 Wed, 29 Mar 2023 23:57:42 -0700 (PDT)
X-Google-Smtp-Source: AK7set/7K3K5TLbAbr1J0Ga1cSqMghtrPv8pV6XrQ0yY3ppidWyKEIP8asqksc66ds9YjSOhxRrjLRylnGNotP2JGHk=
X-Received: by 2002:a9d:6a5a:0:b0:69f:573:6113 with SMTP id
 h26-20020a9d6a5a000000b0069f05736113mr7041195otn.2.1680159462058; Wed, 29 Mar
 2023 23:57:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230330001522.120774-1-andrew@daynix.com>
In-Reply-To: <20230330001522.120774-1-andrew@daynix.com>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 30 Mar 2023 14:57:31 +0800
Message-ID: <CACGkMEvN=bS8L=oz=Kniij_wSsLT38njSwpzioZCZ09aTCuERg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/4] eBPF RSS through QMP support.
To: Andrew Melnychenko <andrew@daynix.com>
Cc: mst@redhat.com, pbonzini@redhat.com, marcandre.lureau@redhat.com, 
 berrange@redhat.com, thuth@redhat.com, philmd@linaro.org, armbru@redhat.com, 
 eblake@redhat.com, qemu-devel@nongnu.org, toke@redhat.com, 
 mprivozn@redhat.com, yuri.benditovich@daynix.com, yan@daynix.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

On Thu, Mar 30, 2023 at 8:33=E2=80=AFAM Andrew Melnychenko <andrew@daynix.c=
om> wrote:
>
> This series of patches provides the ability to retrieve eBPF program
> through qmp, so management application may load bpf blob with proper capa=
bilities.
> Now, virtio-net devices can accept eBPF programs and maps through propert=
ies
> as external file descriptors. Access to the eBPF map is direct through mm=
ap()
> call, so it should not require additional capabilities to bpf* calls.
> eBPF file descriptors can be passed to QEMU from parent process or by uni=
x
> socket with sendfd() qmp command.
>
> Overall, the basic scenario of using the helper looks like this:
>  * Libvirt checks for ebpf_fds property.
>  * Libvirt requests eBPF blob through QMP.
>  * Libvirt loads blob for virtio-net.
>  * Libvirt launches the QEMU with eBPF fds passed.

Is there a libvirt side draft that can be used as a reference?

Thanks

>
> Andrew Melnychenko (4):
>   ebpf: Added eBPF initialization by fds and map update.
>   virtio-net: Added property to load eBPF RSS with fds.
>   ebpf: Added declaration/initialization routines.
>   qmp: Added new command to retrieve eBPF blob.
>
>  ebpf/ebpf.c                    |  48 +++++++++++++
>  ebpf/ebpf.h                    |  25 +++++++
>  ebpf/ebpf_rss-stub.c           |   6 ++
>  ebpf/ebpf_rss.c                | 124 +++++++++++++++++++++++++++------
>  ebpf/ebpf_rss.h                |  10 +++
>  ebpf/meson.build               |   1 +
>  hw/net/virtio-net.c            |  77 ++++++++++++++++++--
>  include/hw/virtio/virtio-net.h |   1 +
>  monitor/qmp-cmds.c             |  17 +++++
>  qapi/misc.json                 |  25 +++++++
>  10 files changed, 307 insertions(+), 27 deletions(-)
>  create mode 100644 ebpf/ebpf.c
>  create mode 100644 ebpf/ebpf.h
>
> --
> 2.39.1
>


