Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C8166DB77
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 11:48:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHjVI-0004Os-No; Tue, 17 Jan 2023 05:47:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pHjVB-0004ON-N3
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 05:47:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pHjV9-0000b8-An
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 05:47:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673952454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QYJJ8vXNePcj/40NrI36sg+XA1ambbgD8sMbwdn1b78=;
 b=QZwlSGFSK0tehe/1R/6Ev/iCqSBYn/+pGvdZA3+ZbxqJx6H4pIWv3+ZqG+ddd8yzyTIQqq
 IzTK51pcmnKT/ZjR728SAP86VEsl8qPzCCBTFBchuIZhABYvj8IgWb7mbuMFIRybDFIB4Z
 MScipQfloqhAA/YZeRJVLSLll6oV0AI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-154-CWav8f_ePAajIMlviYs_XA-1; Tue, 17 Jan 2023 05:47:32 -0500
X-MC-Unique: CWav8f_ePAajIMlviYs_XA-1
Received: by mail-wm1-f72.google.com with SMTP id
 g9-20020a7bc4c9000000b003d214cffa4eso6635276wmk.5
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 02:47:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QYJJ8vXNePcj/40NrI36sg+XA1ambbgD8sMbwdn1b78=;
 b=MNty3Aj4sMfV6COkFfR8UQF45drfMshIypbdFHN1C9KzHKMa5GCymF43fUKpTmSG2P
 ncqlIw0fEgLnXQdBCuMQh6me32cLuYRNh4fEu1YNvr0+e0SGRWlQJRqQrfA3cV2/5mrj
 9dNuNdty0yag+3JiVdZatfgoRLxomP6FG/OryQPMDOZ7EO3gxrBR9SxDY190Swfqx5ql
 IG/A5FTvwOxiBEgAam1uZW6cNtfbrpwmIiqe1YO3TrMjUgrkymA2H6grz7I5TJxm+5UP
 PDBDdBMri/xhUzeQJQqD8Yqe7UIYIRn6M2q2m6tk5Xgi3G4Hwaxac8p1zlcu+pHJbuw3
 Tddg==
X-Gm-Message-State: AFqh2kpajalLjhEByw2JGgSds6vFGrvSiRhpy6lpELY4DwElMCmNb6bm
 GPPXYswZIXNdRdYfD3uHoxixVr6MtiQfY7wsFrBjn1KeRcQQyGc9tEbXwX6u7SE4wygMP40mkz2
 OeWRd9tjkzQCjMR4=
X-Received: by 2002:a5d:48c7:0:b0:2bc:8130:ccb8 with SMTP id
 p7-20020a5d48c7000000b002bc8130ccb8mr2304532wrs.40.1673952451518; 
 Tue, 17 Jan 2023 02:47:31 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs2wRHgTufi3hXxz6U1nyZQooop1fJYGusQ9U2bSNLj8zqQowVDaZC3Cn36kKm/rK5GiWA2zA==
X-Received: by 2002:a5d:48c7:0:b0:2bc:8130:ccb8 with SMTP id
 p7-20020a5d48c7000000b002bc8130ccb8mr2304522wrs.40.1673952451296; 
 Tue, 17 Jan 2023 02:47:31 -0800 (PST)
Received: from work-vm
 (ward-16-b2-v4wan-166627-cust863.vm18.cable.virginm.net. [81.97.203.96])
 by smtp.gmail.com with ESMTPSA id
 b10-20020adfe64a000000b00287da7ee033sm28797962wrn.46.2023.01.17.02.47.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 02:47:30 -0800 (PST)
Date: Tue, 17 Jan 2023 10:47:28 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Het Gala <het.gala@nutanix.com>
Cc: qemu-devel@nongnu.org, prerna.saxena@nutanix.com, quintela@redhat.com,
 pbonzini@redhat.com, berrange@redhat.com, armbru@redhat.com,
 eblake@redhat.com, Manish Mishra <manish.mishra@nutanix.com>,
 Aravind Retnakaran <aravind.retnakaran@nutanix.com>
Subject: Re: [PATCH 1/5] migration: Updated QAPI format for 'migrate' qemu
 monitor command
Message-ID: <Y8Z8wNPLzk5J0EFj@work-vm>
References: <20221226053329.157905-1-het.gala@nutanix.com>
 <20221226053329.157905-2-het.gala@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221226053329.157905-2-het.gala@nutanix.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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

* Het Gala (het.gala@nutanix.com) wrote:
> From: Author Het Gala <het.gala@nutanix.com>
> 
> Existing 'migrate' QAPI design enforces transport mechanism, ip address
> of destination interface and corresponding port number in the form
> of a unified string 'uri' parameter. This scheme does seem to have an issue
> in it, i.e. double-level encoding of URIs.
> 
> The current patch maps existing QAPI design into a well-defined data
> structure - 'MigrateChannel' only from the design perspective. Please note that
> the existing 'uri' parameter is kept untouched for backward compatibility.
> 
> Suggested-by: Daniel P. Berrange <berrange@redhat.com>
> Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
> Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
> Signed-off-by: Het Gala <het.gala@nutanix.com>
> ---
>  qapi/migration.json | 121 +++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 119 insertions(+), 2 deletions(-)
> 
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 88ecf86ac8..753e187ce2 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -1449,12 +1449,108 @@
>  ##
>  { 'command': 'migrate-continue', 'data': {'state': 'MigrationStatus'} }
>  
> +##
> +# @MigrateTransport:
> +#
> +# The supported communication transport mechanisms for migration
> +#
> +# @socket: Supported communication type between two devices for migration.
> +#          Socket is able to cover all of 'tcp', 'unix', 'vsock' and
> +#          'fd' already
> +#
> +# @exec: Supported communication type to redirect migration stream into file.
> +#
> +# @rdma: Supported communication type to redirect rdma type migration stream.
> +#
> +# Since 8.0
> +##
> +{ 'enum': 'MigrateTransport',
> +  'data': ['socket', 'exec', 'rdma'] }
> +
> +##
> +# @MigrateSocketAddr:
> +#
> +# To support different type of socket.
> +#
> +# @socket-type: Different type of socket connections.
> +#
> +# Since 8.0
> +##
> +{ 'struct': 'MigrateSocketAddr',
> +  'data': {'socket-type': 'SocketAddress' } }
> +
> +##
> +# @MigrateExecAddr:
> + #
> + # Since 8.0
> + ##
> +{ 'struct': 'MigrateExecAddr',
> +   'data' : {'exec-str': 'str' } }
> +
> +##
> +# @MigrateRdmaAddr:
> +#
> +# Since 8.0
> +##
> +{ 'struct': 'MigrateRdmaAddr',
> +   'data' : {'rdma-str': 'str' } }
> +
> +##
> +# @MigrateAddress:
> +#
> +# The options available for communication transport mechanisms for migration
> +#
> +# Since 8.0
> +##
> +{ 'union' : 'MigrateAddress',
> +  'base' : { 'transport' : 'MigrateTransport'},
> +  'discriminator' : 'transport',
> +  'data' : {
> +    'socket' : 'MigrateSocketAddr',
> +    'exec' : 'MigrateExecAddr',
> +    'rdma': 'MigrateRdmaAddr' } }
> +
> +##
> +# @MigrateChannelType:
> +#
> +# The supported options for migration channel type requests
> +#
> +# @main: Support request for main outbound migration control channel
> +#
> +# Since 8.0
> +##
> +{ 'enum': 'MigrateChannelType',
> +  'data': [ 'main'] }
> +
> +##
> +# @MigrateChannel:
> +#
> +# Information regarding migration Channel-type for transferring packets,
> +# source and corresponding destination interface for socket connection
> +# and number of multifd channels over the interface.
> +#
> +# @channeltype: Name of Channel type for transfering packet information
> +#
> +# @addr: SocketAddress of destination interface
> +#
> +# Since 8.0
> +##
> +{ 'struct': 'MigrateChannel',
> +  'data' : {
> +	'channeltype' : 'MigrateChannelType',
> +	'addr' : 'MigrateAddress' } }
> +

The presence of the channeltype field suggests you're going to try to
support multiple addresses; that's OK, but can you show an example of
how that might look in the migrate command below?

Dave

>  ##
>  # @migrate:
>  #
>  # Migrates the current running guest to another Virtual Machine.
>  #
>  # @uri: the Uniform Resource Identifier of the destination VM
> +#       for migration thread
> +#
> +# @channel: Struct containing migration channel type, along with all
> +#           the details of destination interface required for initiating
> +#           a migration stream.
>  #
>  # @blk: do block migration (full disk copy)
>  #
> @@ -1479,15 +1575,36 @@
>  # 3. The user Monitor's "detach" argument is invalid in QMP and should not
>  #    be used
>  #
> +# 4. The uri argument should have the Uniform Resource Identifier of default
> +#    destination VM. This connection will be bound to default network
> +#
> +# 5. Both 'uri' and 'channel' arguments, are mututally exclusive but, atleast
> +#    one of the two arguments should be present.
> +#
>  # Example:
>  #
>  # -> { "execute": "migrate", "arguments": { "uri": "tcp:0:4446" } }
>  # <- { "return": {} }
>  #
> +# -> { "execute": "migrate",
> +#      "arguments": {
> +#          "channel": { "channeltype": "main",
> +#                        "addr": { "transport": "socket",
> +#                                  "socket-type": { "type': "inet',
> +#                                                   "host": "10.12.34.9",
> +#                                                   "port": "1050" } } } } }
> +# <- { "return": {} }
> +#
> +# -> { "execute": "migrate",
> +#      "arguments": { "channel": { "channeltype": "main",
> +#                                  "addr": { "transport": "exec",
> +#                                            "exec-str": "/tmp/exec" } } } }
> +# <- { "return": {} }
> +#
>  ##
>  { 'command': 'migrate',
> -  'data': {'uri': 'str', '*blk': 'bool', '*inc': 'bool',
> -           '*detach': 'bool', '*resume': 'bool' } }
> +  'data': {'*uri': 'str', '*channel': 'MigrateChannel', '*blk': 'bool',
> +           '*inc': 'bool', '*detach': 'bool', '*resume': 'bool' } }
>  
>  ##
>  # @migrate-incoming:
> -- 
> 2.22.3
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


