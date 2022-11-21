Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A1F63227D
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 13:42:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox66I-0003qq-Ia; Mon, 21 Nov 2022 07:40:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ox66F-0003qQ-Eb
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 07:40:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ox66D-0002Lc-C5
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 07:40:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669034431;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=KSD/WtaEZRJwlBgO1mp8qwIgZHv4OL8UVBGMR0bXayY=;
 b=d5cLsdI9ty5AvzbKnxghg/7DyXA5dmOY2/eeZrsecbpYWD8gI3zW1tplt4HMK8NA3vdgkr
 TjG9b3LzbhNQuxDIkXoWpNCDlrn86kLQGNiQULhnNKIIwbuPGIs6TFnFZ0L21tESyGmKXV
 sc85oVRLafSVGsv6oxGOv3al+vf0CWc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-266-3AAlm2HQNnWqMytDV0EpBw-1; Mon, 21 Nov 2022 07:40:30 -0500
X-MC-Unique: 3AAlm2HQNnWqMytDV0EpBw-1
Received: by mail-wr1-f72.google.com with SMTP id
 r6-20020adfbb06000000b00241d4028812so903363wrg.20
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 04:40:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KSD/WtaEZRJwlBgO1mp8qwIgZHv4OL8UVBGMR0bXayY=;
 b=fO3sGl2cGqFyH2QYFKTWbHndSri8cXV8G02S+xCla0CTkKoxHwMtW5TSK4822zZJvc
 vLOdgg+LwbeA/+oJmDPf3IoatlWaw9LWnkjukcfj0rc8OKW/q84+kiUG0V39U31wk6Zk
 JjnjjUZ1z6I5XLvSwr81iT+suVaYOeFeiVCyHJnikvbT9WjAGfwJ8/AG/o7TQeLWWX15
 oKJUEKgbhBzCtUn6oZ2gOvgs1LvODdF1U7sN5jD3X2vJ64mItLV3wqdmdFnB6hzuKunc
 l+N81yT1ElvQ/mFXMiyiYzxHEgUc9jECupwbdCYKFNimesnqQzGlw7RTJMWQu4bKj5sW
 IxDw==
X-Gm-Message-State: ANoB5pm/RI0/KNgA+eAyWn07puWvcC0BJ1N+qu66ZHdvoahFKejz4We7
 j7GFj8qDqhDCWXxgZnQQaF98piD87ChKp0DvoBUpHDH5hJwiSjmXOe8weqVFHfee5Zhuep9fyc6
 iSAWwk+530WFM+LU=
X-Received: by 2002:a5d:5685:0:b0:235:f0a6:fafd with SMTP id
 f5-20020a5d5685000000b00235f0a6fafdmr11166178wrv.75.1669034428994; 
 Mon, 21 Nov 2022 04:40:28 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7dt6JVBwsxN9pQM4AdRPXr8hS7OsYMxw2uqGfR6/HpzraG76xFOy2tMGoW90YgSJmmKz1bfQ==
X-Received: by 2002:a5d:5685:0:b0:235:f0a6:fafd with SMTP id
 f5-20020a5d5685000000b00235f0a6fafdmr11166152wrv.75.1669034428681; 
 Mon, 21 Nov 2022 04:40:28 -0800 (PST)
Received: from redhat.com (62.117.240.223.dyn.user.ono.com. [62.117.240.223])
 by smtp.gmail.com with ESMTPSA id
 v3-20020a1cf703000000b003cf774c31a0sm16802720wmh.16.2022.11.21.04.40.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Nov 2022 04:40:28 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Het Gala <het.gala@nutanix.com>
Cc: qemu-devel@nongnu.org,  prerna.saxena@nutanix.com,  dgilbert@redhat.com,
 pbonzini@redhat.com,  berrange@redhat.com,  armbru@redhat.com,
 eblake@redhat.com,  Aravind Retnakaran <aravind.retnakaran@nutanix.com>,
 Manish Mishra <manish.mishra@nutanix.com>
Subject: Re: [PATCH] multifd: Updated QAPI format for 'migrate' qemu monitor
 command
In-Reply-To: <20221121110427.198431-1-het.gala@nutanix.com> (Het Gala's
 message of "Mon, 21 Nov 2022 11:04:27 +0000")
References: <20221121110427.198431-1-het.gala@nutanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Mon, 21 Nov 2022 13:40:27 +0100
Message-ID: <87pmdgtr9g.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Het Gala <het.gala@nutanix.com> wrote:
> To prevent double data encoding of uris, instead of passing transport
> mechanisms, host address and port all together in form of a single string
> and writing different parsing functions, we intend the user to explicitly
> mention most of the parameters through the medium of qmp command itself.
>
> The current patch is continuation of patchset series
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg901274.html
> and reply to the ongoing discussion for better QAPI design here
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg903753.html.
>
> Suggested-by: Daniel P. Berrange <berrange@redhat.com>
> Suggested-by: Aravind Retnakaran <aravind.retnakaran@nutanix.com>
> Suggested-by: Manish Mishra <manish.mishra@nutanix.com>
> Signed-off-by: Het Gala <het.gala@nutanix.com>


Hi

1st of all, I can't see how this is 7.1 material, I guess we need to
move it to 8.0.

> ---
>  qapi/migration.json | 127 +++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 125 insertions(+), 2 deletions(-)
>
> diff --git a/qapi/migration.json b/qapi/migration.json
> index 88ecf86ac8..fd9286ea0f 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -1449,12 +1449,101 @@
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
> +# Since 7.1
> +##
> +{ 'enum': 'MigrateTransport',
> +  'data': ['socket', 'exec'] }

I haven't looked too much into this, but as Danield told in the past, I
can see where the rdma falls into this scheme.  I guess it is going to
be its own, but who knows.

> +# The supported options for migration channel type requests
> +#
> +# @control: Support request for main outbound migration control channel
> +#
> +# @data: Supported Channel type for multifd data channels
> +#
> +# @async: Supported Channel type for post-copy async requests
> +#
> +# Since 7.1
> +##
> +{ 'enum': 'MigrateChannelType',
> +  'data': ['control', 'data', 'async'] }
> +

'data': ['main', 'data', 'ram-async'] } ???

I don't like the 'control' name because without multifd we still pass
everything through it.

And with multifd, we still pass all devices through it.

About the asynchronous channel, I don't know if calling it postcopy is
better.

> +{ 'struct': 'MigrateChannel',
> +  'data' : {
> +    'channeltype' : 'MigrateChannelType',
> +    '*src-addr' : 'MigrateAddress',
> +    'dest-addr' : 'MigrateAddress',

Why do we want *both* addresses?

> +    '*multifd-count' : 'int' } }

And if we are passing a list, why do we want to pass the real number?

>  # -> { "execute": "migrate", "arguments": { "uri": "tcp:0:4446" } }
>  # <- { "return": {} }
>  #
> +# -> { "execute": "migrate",
> +#      "arguments": {
> +#          "channels": [ { 'channeltype': 'control',
> +#                          'dest-addr': {'transport': 'socket',
> +#                                        'type': 'inet',
> +#                                        'host': '10.12.34.9', 'port': '1050'}},
> +#                        { 'channeltype': 'data',
> +#                          'src-addr': {'transport': 'socket',
> +#                                        'type': 'inet',
> +#                                        'host': '10.12.34.9',
> +#                                        'port': '4000', 'ipv4': 'true'},
> +#                          'dest-addr': { 'transport': 'socket',
> +#                                          'type': 'inet',
> +#                                          'host': '10.12.34.92',
> +#                                          'port': '1234', 'ipv4': 'true'},
> +#                          'multifd-count': 5 },
> +#                        { 'channeltype': 'data',
> +#                          'src-addr': {'transport': 'socket',
> +#                                        'type': 'inet',
> +#                                        'host': '10.2.3.4', 'port': '1000'},
> +#                          'dest-addr': {'transport': 'socket',
> +#                                         'type': 'inet',
> +#                                         'host': '0.0.0.4', 'port': '3000'},
> +#                          'multifd-count': 3 } ] } }
> +# <- { "return": {} }
> +#
>  ##
>  { 'command': 'migrate',
> -  'data': {'uri': 'str', '*blk': 'bool', '*inc': 'bool',
> -           '*detach': 'bool', '*resume': 'bool' } }
> +  'data': {'*uri': 'str', '*channels': ['MigrateChannel'], '*blk': 'bool',

I think that "uri" bit should be dropped, right?

> +           '*inc': 'bool', '*detach': 'bool', '*resume': 'bool' } }
>  
>  ##
>  # @migrate-incoming:

I can't see how to make the old one to work on top of this one (i.e. we
would have to create strings from lists on QAPI, I think that is just
too much).

So I think that the best way (I know I am contradicting myself) is to
create a new migrate command and just let the old one alone.  That way:
- you can drop blk and blk
- you can do anything that you want with the uris, as assuming that they
  are always sockets.
- I would not care at all about the "exec" protocol, just leave that
  alone in the deprecated command.  Right now:
  * we can't move it to multifd without a lot of PAIN
  * there are patches on the list suggesting that what we really want is
    to create a file that is the size of RAM and just write all the RAM
    at the right place.
  * that would make the way to create snapshots (I don't know if anyones
    still wants them, much easier).
  * I think that the only real use of exec migration was to create
    snapshots, for real migration, using a socket is much, much saner.
  * I.e. what I mean here is that for exec migration, we need to think
    if we want to continue supporting it for normal migration, or only
    as a way to create snapshots.

What do you think?

Later, Juan.


