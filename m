Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 856BE3F3621
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 23:43:37 +0200 (CEST)
Received: from localhost ([::1]:53708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHCIa-0002uE-4w
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 17:43:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mHCHn-0002EY-8m
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 17:42:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mHCHk-0006Gv-3U
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 17:42:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629495762;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wsfcKxoxMDtmBSK9evb4du3i5b1AT+671htmCqW/vew=;
 b=AszdSwzFRWr7a8k+C625UNuF7b+hnIk92HhYlEYd7t8fZflXl1tfqZfkcMc7PdZlvHyYAo
 Q6ZkpJjYNA11Q+yID7mVmRPdfS310rXvAaUyLKXaAITRpd3rdGa8HeZTYRyWj6uOdwlXgp
 aqBTHsr6bpp+beAajXYQgKoqGBSNpQo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-bj_dEpLMO6iXkfvF5s_udg-1; Fri, 20 Aug 2021 17:42:41 -0400
X-MC-Unique: bj_dEpLMO6iXkfvF5s_udg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3AE771015184;
 Fri, 20 Aug 2021 21:42:40 +0000 (UTC)
Received: from redhat.com (ovpn-113-99.phx2.redhat.com [10.3.113.99])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A9AEA10016F4;
 Fri, 20 Aug 2021 21:42:39 +0000 (UTC)
Date: Fri, 20 Aug 2021 16:42:38 -0500
From: Eric Blake <eblake@redhat.com>
To: Tao Xu <tao3.xu@intel.com>
Subject: Re: [PATCH v2] net/colo: check vnet_hdr_support flag when using
 virtio-net
Message-ID: <20210820214238.yxly3k7chfi6xakb@redhat.com>
References: <20210819012717.318050-1-tao3.xu@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210819012717.318050-1-tao3.xu@intel.com>
User-Agent: NeoMutt/20210205-733-8f834e
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: chen.zhang@intel.com, jasowang@redhat.com, qemu-devel@nongnu.org,
 lizhijian@cn.fujitsu.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 19, 2021 at 09:27:17AM +0800, Tao Xu wrote:
> When COLO use only one vnet_hdr_support parameter between
> COLO network filter(filter-mirror, filter-redirector or
> filter-rewriter and colo-compare, packet will not be parsed
> correctly. Acquire network driver related to COLO, if it is
> nirtio-net, check vnet_hdr_support flag of COLO network filter
> and colo-compare.
> 
> Signed-off-by: Tao Xu <tao3.xu@intel.com>
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> ---

> +++ b/qapi/qom.json
> @@ -241,6 +241,11 @@
>  # @notify_dev: name of the character device backend to be used to communicate
>  #              with the remote colo-frame (only for Xen COLO)
>  #
> +# @netdev: id of the network device backend to colo-compare, although
> +#          colo-compare doesn't depend on network device directly, this
> +#          parameter help colo-compare know what network driver it is
> +#          working on

Missing a '(since 6.2)' tag.

Grammar suggestion: s/colo-compare, although/colo-compare. Although/
s/help/helps/



> +#
>  # @compare_timeout: the maximum time to hold a packet from @primary_in for
>  #                   comparison with an incoming packet on @secondary_in in
>  #                   milliseconds (default: 3000)
> @@ -264,6 +269,7 @@
>              'outdev': 'str',
>              'iothread': 'str',
>              '*notify_dev': 'str',
> +            '*netdev': 'str',
>              '*compare_timeout': 'uint64',
>              '*expired_scan_cycle': 'uint32',
>              '*max_queue_size': 'uint32',
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 83aa59a920..b31ce3c87d 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -4957,12 +4957,14 @@ SRST
>          stored. The file format is libpcap, so it can be analyzed with
>          tools such as tcpdump or Wireshark.
>  
> -    ``-object colo-compare,id=id,primary_in=chardevid,secondary_in=chardevid,outdev=chardevid,iothread=id[,vnet_hdr_support][,notify_dev=id][,compare_timeout=@var{ms}][,expired_scan_cycle=@var{ms}][,max_queue_size=@var{size}]``
> +    ``-object colo-compare,id=id,primary_in=chardevid,secondary_in=chardevid,outdev=chardevid,iothread=id[,netdev=netdevid][,vnet_hdr_support][,notify_dev=id][,compare_timeout=@var{ms}][,expired_scan_cycle=@var{ms}][,max_queue_size=@var{size}]``
>          Colo-compare gets packet from primary\_in chardevid and
>          secondary\_in, then compare whether the payload of primary packet
>          and secondary packet are the same. If same, it will output
>          primary packet to out\_dev, else it will notify COLO-framework to do
> -        checkpoint and send primary packet to out\_dev. In order to
> +        checkpoint and send primary packet to out\_dev. Although colo-compare
> +        does not depend on network device directly, netdevid help

s/help/helps/

> +        colo-compare know what network driver it is working on. In order to
>          improve efficiency, we need to put the task of comparison in
>          another iothread. If it has the vnet\_hdr\_support flag,
>          colo compare will send/recv packet with vnet\_hdr\_len.
> -- 
> 2.25.1
> 
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


