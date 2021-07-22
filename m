Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 235B43D1FCA
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 10:20:12 +0200 (CEST)
Received: from localhost ([::1]:38972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6TwB-0005K2-66
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 04:20:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1m6TvI-0003yg-Ar
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 04:19:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1m6TvG-0001rC-Oy
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 04:19:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626941953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B68atyballxrztp1XoefKlwX0TOtkdAO7Ow1bLeGiNE=;
 b=Q/MSrSJwIk3R6K1dupNlRvWjAM1jh7C2hFgzCLBrUzaCPCtXr2hBkQlTtzpQLgo11DVDBT
 LFsw9BpjxTWNwWtWHM/Kz6okb19NdmuHms5hmsS4lfLy3Vd/NR/Z/9bpeEMqf4hKYa++eV
 +Niau2skEzStEE2IXo0clgWRCO/6jyU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-YXE2F5vCNyeyKZlodw_djw-1; Thu, 22 Jul 2021 04:19:12 -0400
X-MC-Unique: YXE2F5vCNyeyKZlodw_djw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A862680430C
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 08:19:11 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A63960CA1;
 Thu, 22 Jul 2021 08:19:07 +0000 (UTC)
Date: Thu, 22 Jul 2021 10:19:04 +0200
From: Peter Krempa <pkrempa@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PULL 36/40] vl: switch -M parsing to keyval
Message-ID: <YPkp+PF8kUyK9sy+@angien.pipo.sk>
References: <20210706100141.303960-1-pbonzini@redhat.com>
 <20210706100141.303960-37-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210706100141.303960-37-pbonzini@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: libvir-list@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CC libvir-list

On Tue, Jul 06, 2021 at 12:01:37 +0200, Paolo Bonzini wrote:
> Switch from QemuOpts to keyval.  This enables the introduction
> of non-scalar machine properties, and JSON syntax in the future.
> 
> For JSON syntax to be supported right now, we would have to
> consider what would happen if string-based dictionaries (produced by
> -M key=val) were to be merged with strongly-typed dictionaries
> (produced by -M {'key': 123}).
> 
> The simplest way out is to never enter the situation, and only allow one
> -M option when JSON syntax is in use.  However, we want options such as
> -smp to become syntactic sugar for -M, and this is a problem; as soon
> as -smp becomes a shortcut for -M, QEMU would forbid using -M '{....}'
> together with -smp.  Therefore, allowing JSON syntax right now for -M
> would be a forward-compatibility nightmare and it would be impossible
> anyway to introduce -M incrementally in tools.
> 
> Instead, support for JSON syntax is delayed until after the main
> options are converted to QOM compound properties.  These include -boot,
> -acpitable, -smbios, -m, -semihosting-config, -rtc and -fw_cfg.  Once JSON
> syntax is introduced, these options will _also_ be forbidden together
> with -M '{...}'.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  softmmu/vl.c | 315 ++++++++++++++++++++++++---------------------------
>  1 file changed, 146 insertions(+), 169 deletions(-)

This patch breaks detection of certain machine options features in
libvirt which were being detected from 'query-command-line-options'.

I presume the change simply removed this from the output of
query-command-line-options due to the historical cruft how the
aforementioned command works.

Unfortunately I didn't find any suitable replacement from what we are
querying.

The entries which we now lack detection are:

    { "machine", "mem-merge", QEMU_CAPS_MEM_MERGE },
    { "machine", "aes-key-wrap", QEMU_CAPS_AES_KEY_WRAP },
    { "machine", "dea-key-wrap", QEMU_CAPS_DEA_KEY_WRAP },
    { "machine", "kernel_irqchip", QEMU_CAPS_MACHINE_KERNEL_IRQCHIP },
    { "machine", "loadparm", QEMU_CAPS_LOADPARM },

Note that the oldest supported qemu version in libvirt is 2.11 at this
point and all the above flags are included in 2.11 and later.

This means we can theoretically remove the detection and always assume
the flags in case when they are unlikely to be removed in the future.

Alternatively if you can suggest an option how to detect this it will be
welcome.

Thanks

Peter


