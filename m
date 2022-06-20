Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 081395511C5
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 09:47:47 +0200 (CEST)
Received: from localhost ([::1]:50832 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3C8P-0000al-Kp
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 03:47:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o3C65-00083Y-0C
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 03:45:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1o3C61-0004ph-3T
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 03:45:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655711116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VsuOPJyDdhNw1LA/IYLmP7EvH4W949TyXkBQKFa8tfw=;
 b=VU69GsTTrV/5ZmDTfoHCi/DJSv2Gz8wsGP64lenMhxbuWb1YIgTRjhQ3lnOpOqIQFrsH6E
 PXTTYMtd0hRzcZEEtZterpz2EclgvlG6+InkdXmZXzd1F7xXgRf65dkasDDR8DAhfPZjlB
 Z3mOUwI2EcJm8eUMprW9LOCLo8JT+0U=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-102-WoEEFEEFMgCiVOuJkgIWRA-1; Mon, 20 Jun 2022 03:45:12 -0400
X-MC-Unique: WoEEFEEFMgCiVOuJkgIWRA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 52A843C163C0;
 Mon, 20 Jun 2022 07:45:12 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 041B51415109;
 Mon, 20 Jun 2022 07:45:12 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BACC921E688E; Mon, 20 Jun 2022 09:45:10 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Zhang Chen <chen.zhang@intel.com>
Cc: Jason Wang <jasowang@redhat.com>,  qemu-dev <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,  Eduardo Habkost <eduardo@habkost.net>,  Eric Blake
 <eblake@redhat.com>,  Peter Maydell <peter.maydell@linaro.org>,  Thomas
 Huth <thuth@redhat.com>,  Laurent Vivier <lvivier@redhat.com>,  Yuri
 Benditovich <yuri.benditovich@daynix.com>,  Andrew Melnychenko
 <andrew@daynix.com>
Subject: Re: [RFC PATCH 08/12] qapi: Add FilterUbpfProperties and qemu-options
References: <20220617073630.535914-1-chen.zhang@intel.com>
 <20220617073630.535914-9-chen.zhang@intel.com>
Date: Mon, 20 Jun 2022 09:45:10 +0200
In-Reply-To: <20220617073630.535914-9-chen.zhang@intel.com> (Zhang Chen's
 message of "Fri, 17 Jun 2022 15:36:26 +0800")
Message-ID: <871qvj6ant.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Zhang Chen <chen.zhang@intel.com> writes:

> Add filter-ubpf related QOM and qemu-options.
>
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> ---
>  qapi/qom.json   | 18 ++++++++++++++++++
>  qemu-options.hx |  6 ++++++
>  2 files changed, 24 insertions(+)
>
> diff --git a/qapi/qom.json b/qapi/qom.json
> index 6a653c6636..820a5218e8 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -444,6 +444,22 @@
>    'base': 'NetfilterProperties',
>    'data': { '*vnet_hdr_support': 'bool' } }
>  
> +##
> +# @FilterUbpfProperties:
> +#
> +# Properties for filter-ubpf objects.
> +#
> +# @ip-mode: if true, IP packet handle mode is enabled(default: true).

Space between "enabled" and "(default: true)", please.

I'm not sure about the name @ip-mode.  A mode tends to be an enum.  A
boolean tends to be a flag, like @disable-packed-handle-mode.  Note that
I reverted the sense there, to make the default false.

> +#
> +# @ubpf-handler: The filename where the userspace ebpf packets handler.
> +#
> +# Since: 7.1
> +##
> +{ 'struct': 'FilterUbpfProperties',
> +  'base': 'NetfilterProperties',
> +  'data': { '*ip-mode': 'bool',
> +            '*ubpf-handler': 'str' } }
> +
>  ##
>  # @InputBarrierProperties:
>  #
> @@ -845,6 +861,7 @@
>      'filter-redirector',
>      'filter-replay',
>      'filter-rewriter',
> +    'filter-ubpf',
>      'input-barrier',
>      { 'name': 'input-linux',
>        'if': 'CONFIG_LINUX' },
> @@ -911,6 +928,7 @@
>        'filter-redirector':          'FilterRedirectorProperties',
>        'filter-replay':              'NetfilterProperties',
>        'filter-rewriter':            'FilterRewriterProperties',
> +      'filter-ubpf':                'FilterUbpfProperties',
>        'input-barrier':              'InputBarrierProperties',
>        'input-linux':                { 'type': 'InputLinuxProperties',
>                                        'if': 'CONFIG_LINUX' },
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 60cf188da4..3dfb858867 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -5080,6 +5080,12 @@ SRST
>          stored. The file format is libpcap, so it can be analyzed with
>          tools such as tcpdump or Wireshark.
>  
> +    ``-object filter-ubpf,id=id,netdev=dev,ubpf-handler=filename[,ip-mode][,position=head|tail|id=<id>][,insert=behind|before]``
> +        filter-ubpf is the userspace ebpf network traffic handler on netdev dev
> +        from the userspace ebpf handler file specified by filename.

I believe the conventional capitalization is eBPF.

> +        If disable ip_mode, the loaded ebpf program will handle raw

Markup: ``ip_mode``.

> +        network packet.

Suggest something like "If ``ip_mode`` is off, the eBPF program is fed
raw network packets" (hope I'm not misinterpreting things).

> +
>      ``-object colo-compare,id=id,primary_in=chardevid,secondary_in=chardevid,outdev=chardevid,iothread=id[,vnet_hdr_support][,notify_dev=id][,compare_timeout=@var{ms}][,expired_scan_cycle=@var{ms}][,max_queue_size=@var{size}]``
>          Colo-compare gets packet from primary\_in chardevid and
>          secondary\_in, then compare whether the payload of primary packet


