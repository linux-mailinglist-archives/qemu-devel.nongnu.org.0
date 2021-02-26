Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 475FD3267A3
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 21:05:41 +0100 (CET)
Received: from localhost ([::1]:57194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFjMq-0006m8-5s
	for lists+qemu-devel@lfdr.de; Fri, 26 Feb 2021 15:05:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lFjKZ-0005Is-3I
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 15:03:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lFjKV-0000Y4-Qo
 for qemu-devel@nongnu.org; Fri, 26 Feb 2021 15:03:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614369794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tC3V6iD1ugTc7qLkhGP/Ms26Nvm91yebG5y/KzuNTEU=;
 b=b8t6XACsafHGcerjBfPdPZCmR7EskEutOruRXzLiuPUCLKaHuJ+HoTflqVElVU2I02pKqe
 wAw2E30J/D7d10e8JITu/1wK0kUH4qhsvNU4oXQyfZ89LJVIcaSze3b22kJdxY0vuL9pkS
 1QMzKl5zcA/0BYNGDWK8bRddBcVU5XY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-rM12nuYXPXOpt8UDmMv0Fw-1; Fri, 26 Feb 2021 15:03:10 -0500
X-MC-Unique: rM12nuYXPXOpt8UDmMv0Fw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 111F6107ACC7;
 Fri, 26 Feb 2021 20:03:09 +0000 (UTC)
Received: from [10.3.113.12] (ovpn-113-12.phx2.redhat.com [10.3.113.12])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A5905C3E6;
 Fri, 26 Feb 2021 20:03:01 +0000 (UTC)
To: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org
References: <20210224135255.253837-1-kwolf@redhat.com>
 <20210224135255.253837-15-kwolf@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Subject: Re: [PATCH v2 14/31] qapi/qom: Add ObjectOptions for filter-*
Message-ID: <1a0108f7-d70a-d77e-313c-62e478c5616b@redhat.com>
Date: Fri, 26 Feb 2021 14:03:00 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210224135255.253837-15-kwolf@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.349, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: lvivier@redhat.com, thuth@redhat.com, pkrempa@redhat.com,
 berrange@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 libvir-list@redhat.com, jasowang@redhat.com, armbru@redhat.com,
 mreitz@redhat.com, kraxel@redhat.com, pbonzini@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/21 7:52 AM, Kevin Wolf wrote:
> This adds a QAPI schema for the properties of the filter-* objects.
> 
> Some parts of the interface (in particular NetfilterProperties.position)
> are very unusual for QAPI, but for now just describe the existing
> interface.
> 
> net.json can't be included in qom.json because the storage daemon
> doesn't have it. NetFilterDirection is still required in the new object
> property definitions in qom.json, so move this enum to common.json.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  qapi/common.json |  20 +++++++
>  qapi/net.json    |  20 -------
>  qapi/qom.json    | 143 +++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 163 insertions(+), 20 deletions(-)
> 

> +++ b/qapi/qom.json
> @@ -313,6 +313,137 @@
>    'data': { 'addr': 'str' ,
>              '*id-list': 'str' } }
>  
> +##
> +# @NetfilterInsert:
> +#
> +# Indicates where to insert a netfilter relative to a given other filter.
> +#
> +# @before: insert before the specified filter
> +#
> +# @behind: insert behind the specified filter
> +#
> +# Since: 5.0
> +##
> +{ 'enum': 'NetfilterInsert',
> +  'data': [ 'before', 'behind' ] }
> +
> +##
> +# @NetfilterProperties:
> +#
> +# Properties for objects of classes derived from netfilter.
> +#
> +# @netdev: id of the network device backend to filter
> +#
> +# @queue: indicates which queue(s) to filter (default: all)
> +#
> +# @status: indicates whether the filter is enabled ("on") or disabled ("off")
> +#          (default: "on")

An enum would be nicer than 'str', but your commit message is accurate.

> +#
> +# @position: specifies where the filter should be inserted in the filter list.
> +#            "head" means the filter is inserted at the head of the filter list,
> +#            before any existing filters.
> +#            "tail" means the filter is inserted at the tail of the filter list,
> +#            behind any existing filters (default).
> +#            "id=<id>" means the filter is inserted before or behind the filter
> +#            specified by <id>, depending on the @insert property.
> +#            (default: "tail")
> +#

Wow, you're not kidding about this not being typical QAPI.  Oh well.

> +# @insert: where to insert the filter relative to the filter given in @position.
> +#          Ignored if @position is "head" or "tail". (default: behind)

Back to the question of if it is worth updating the QAPI generator to
allow a flat union as the branch of yet another flat union.  If we did
that, we could have (untested):

{ 'enum': 'NetfilterPosition', 'data': [ 'head', 'tail', 'id' ] }
{ 'union': 'NetfilterBase',
  'base': { 'position': 'NetfilterPosition',
            'netdev'..., 'queue', 'status'... },
  'discriminator': 'position',
  'data': { 'head': {}, 'tail': {},
            'id': { '*insert': 'NetfilterInsert', 'id': 'str' } }

but that is a change to our existing id=xyz parsing, so we may need an
alias or deprecation period...

> +#
> +# Since: 2.5
> +##
> +{ 'struct': 'NetfilterProperties',
> +  'data': { 'netdev': 'str',
> +            '*queue': 'NetFilterDirection',
> +            '*status': 'str',
> +            '*position': 'str',
> +            '*insert': 'NetfilterInsert' } }
> +
> +##
> +# @FilterBufferProperties:
> +#
> +# Properties for filter-buffer objects.
> +#
> +# @interval: a non-zero interval in microseconds.  All packets arriving in the
> +#            given interval are delayed until the end of the interval.
> +#
> +# Since: 2.5
> +##
> +{ 'struct': 'FilterBufferProperties',
> +  'base': 'NetfilterProperties',
> +  'data': { 'interval': 'uint32' } }

matches net/filter-buffer.c:filter_buffer_class_init().

> +
> +##
> +# @FilterDumpProperties:
> +#
> +# Properties for filter-dump objects.
> +#
> +# @file: the filename where the dumped packets should be stored
> +#
> +# @maxlen: maximum number of bytes in a packet that are stored (default: 65536)
> +#
> +# Since: 2.5
> +##
> +{ 'struct': 'FilterDumpProperties',
> +  'base': 'NetfilterProperties',
> +  'data': { 'file': 'str',
> +            '*maxlen': 'uint32' } }

Matches net/dump.c:filter_dump_class_init().

> +
> +##
> +# @FilterMirrorProperties:
> +#
> +# Properties for filter-mirror objects.
> +#
> +# @outdev: the name of a character device backend to which all incoming packets
> +#          are mirrored
> +#
> +# @vnet_hdr_support: if true, vnet header support is enabled (default: false)
> +#
> +# Since: 2.6
> +##
> +{ 'struct': 'FilterMirrorProperties',
> +  'base': 'NetfilterProperties',
> +  'data': { 'outdev': 'str',
> +            '*vnet_hdr_support': 'bool' } }

Matches filter-mirror.c:filter_mirror_class_init().  For the future, can
we rename to vnet-hdr-support?

> +
> +##
> +# @FilterRedirectorProperties:
> +#
> +# Properties for filter-redirector objects.
> +#
> +# At least one of @indev or @outdev must be present.  If both are present, they
> +# must not refer to the same character device backend.
> +#
> +# @indev: the name of a character device backend from which packets are
> +#         received and redirected to the filtered network device
> +#
> +# @outdev: the name of a character device backend to which all incoming packets
> +#          are redirected
> +#
> +# @vnet_hdr_support: if true, vnet header support is enabled (default: false)
> +#
> +# Since: 2.6
> +##
> +{ 'struct': 'FilterRedirectorProperties',
> +  'base': 'NetfilterProperties',
> +  'data': { '*indev': 'str',
> +            '*outdev': 'str',
> +            '*vnet_hdr_support': 'bool' } }

Matches net/filter-mirror.c:filter_redirector_class_init().

> +
> +##
> +# @FilterRewriterProperties:
> +#
> +# Properties for filter-rewriter objects.
> +#
> +# @vnet_hdr_support: if true, vnet header support is enabled (default: false)
> +#
> +# Since: 2.8
> +##
> +{ 'struct': 'FilterRewriterProperties',
> +  'base': 'NetfilterProperties',
> +  'data': { '*vnet_hdr_support': 'bool' } }
> +

Matches net/filter-rewriter.c:filter_rewriter_class_init().

>  ##
>  # @IothreadProperties:
>  #
> @@ -508,6 +639,12 @@
>      'cryptodev-backend-builtin',
>      'cryptodev-vhost-user',
>      'dbus-vmstate',
> +    'filter-buffer',
> +    'filter-dump',
> +    'filter-mirror',
> +    'filter-redirector',
> +    'filter-replay',
> +    'filter-rewriter',
>      'iothread',
>      'memory-backend-file',
>      'memory-backend-memfd',
> @@ -550,6 +687,12 @@
>        'cryptodev-backend-builtin':  'CryptodevBackendProperties',
>        'cryptodev-vhost-user':       'CryptodevVhostUserProperties',
>        'dbus-vmstate':               'DBusVMStateProperties',
> +      'filter-buffer':              'FilterBufferProperties',
> +      'filter-dump':                'FilterDumpProperties',
> +      'filter-mirror':              'FilterMirrorProperties',
> +      'filter-redirector':          'FilterRedirectorProperties',
> +      'filter-replay':              'NetfilterProperties',
> +      'filter-rewriter':            'FilterRewriterProperties',
>        'iothread':                   'IothreadProperties',
>        'memory-backend-file':        'MemoryBackendFileProperties',
>        'memory-backend-memfd':       'MemoryBackendMemfdProperties',
> 

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


