Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3296804F9
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 05:28:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMLlb-0004L3-PE; Sun, 29 Jan 2023 23:27:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMLla-0004Ke-2w
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 23:27:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMLlY-0003Lr-92
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 23:27:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675052855;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ed176zkhGmQKXBRs1tXFc2fhdsfDI7fCJq5vuhGpNGY=;
 b=XzIIVJAbXy9gS66RI9cgoyI7hHcgHLOcxzLKPgowT8x0rpDV1SNn7qUd/nCoC8f2lKX2Xn
 e5rbBkkCYYXDWsoKctCfsOXrF1WXKkwVGUfTFqFr4qbCKa1CG57Rsff076aJRG1Ud6PUJM
 fJOHmgW19kxTUUhpst1Ip8bTK+rjuwY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-654-psmWg-sKMF-nn5Cj1naSdA-1; Sun, 29 Jan 2023 23:27:33 -0500
X-MC-Unique: psmWg-sKMF-nn5Cj1naSdA-1
Received: by mail-wm1-f72.google.com with SMTP id
 l19-20020a7bc353000000b003dc554c8263so1695042wmj.3
 for <qemu-devel@nongnu.org>; Sun, 29 Jan 2023 20:27:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ed176zkhGmQKXBRs1tXFc2fhdsfDI7fCJq5vuhGpNGY=;
 b=VTRqKw23OFqN/p+bU8DXs19FM+jr+51qFy3qlzwZ+m6C4OYJJ46KT2hSp3Vt1IgCmM
 QFwR2iiOhBUy4+VjFjSpEpZyEEe9EOMMHGhgkbqNPX/S3zkBOnLkIxq8Mo/wRq98LTnQ
 YJCqNrpoxR+yEQx8ceBmDWecSbX/rgm/bVfXatFcDe/llJxos0XSJZpbspwoNm1I/yyS
 jSl4Fw2zoPqKXOrc3wJLY7/vQANgeRfcx8W0nv8iYnQSN9vTrB1Zp8fN3c0ViCEyYBPL
 tqFRo2hOELa5u0h33aIr5udahUOhgh2glx6dQAoah90eENPRs962dymF0fC9imbQeDnk
 OvPQ==
X-Gm-Message-State: AFqh2krRQG1fwvqKPb0nP5ZR1SH+1HnQf2ZIL2LZ7dz0u5zcgGknsXsa
 5RcYdB/d2MEGjkMOk3rkgazjPeRpyUmctf9JZ0wlm4cTPoPLVL1pPMD5ZFehbrd5dDpQ2Erycg0
 0i5hzpJbx/919jog=
X-Received: by 2002:a05:600c:3d16:b0:3d0:6a57:66a5 with SMTP id
 bh22-20020a05600c3d1600b003d06a5766a5mr47806997wmb.0.1675052851927; 
 Sun, 29 Jan 2023 20:27:31 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsWwQHuT1zggkg8hYar6465NQHiYRlQlymVXRd6PiMlmwzSxAUkQGj1pAR3IvMTYbM0HMTLZA==
X-Received: by 2002:a05:600c:3d16:b0:3d0:6a57:66a5 with SMTP id
 bh22-20020a05600c3d1600b003d06a5766a5mr47806989wmb.0.1675052851717; 
 Sun, 29 Jan 2023 20:27:31 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 a19-20020a05600c349300b003cfa622a18asm15533013wmq.3.2023.01.29.20.27.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 20:27:31 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Jiang Jiacheng <jiangjiacheng@huawei.com>
Cc: <qemu-devel@nongnu.org>,  <berrange@redhat.com>,  <dgilbert@redhat.com>,
 <yubihong@huawei.com>,  <xiexiangyou@huawei.com>,
 <zhengchuan@huawei.com>,  <linyilu@huawei.com>
Subject: Re: [PATCH 2/3] migration: implement query migration threadinfo by
 name
In-Reply-To: <20230120084735.825054-3-jiangjiacheng@huawei.com> (Jiang
 Jiacheng's message of "Fri, 20 Jan 2023 16:47:34 +0800")
References: <20230120084735.825054-1-jiangjiacheng@huawei.com>
 <20230120084735.825054-3-jiangjiacheng@huawei.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 30 Jan 2023 05:27:30 +0100
Message-ID: <87o7qgode5.fsf@secure.mitica>
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

Jiang Jiacheng <jiangjiacheng@huawei.com> wrote:
> Introduce interface query-migrationthreads. The interface is use
> with the migration thread name reported by qemu and returns with
> migration thread name and its pid.
> Introduce threadinfo.c to manage threads with migration.
>
> Signed-off-by: Jiang Jiacheng <jiangjiacheng@huawei.com>

I like this query interface better than the way you expose the thread
name in the 1st place.

But once that we are here, why don't we just "tweak" abit the interface:

> diff --git a/qapi/migration.json b/qapi/migration.json
> index b0cf366ac0..e93c3e560a 100644
> --- a/qapi/migration.json
> +++ b/qapi/migration.json
> @@ -1970,6 +1970,36 @@
>  { 'command': 'query-vcpu-dirty-limit',
>    'returns': [ 'DirtyLimitInfo' ] }
>  
> +##
> +# @MigrationThreadInfo:
> +#
> +# Information about migrationthreads
> +#
> +# @name: the name of migration thread
> +#
> +# @thread-id: ID of the underlying host thread
> +#
> +# Since: 7.2
> +##
> +{ 'struct': 'MigrationThreadInfo',
> +  'data': {'name': 'str',
> +           'thread-id': 'int'} }

1st, it is an int enough for all architectures?  I know that for linux
and friends it is, but not sure about windows and other weird systems.

> +##
> +# @query-migrationthreads:

What about renaming this to:

@query-migrationthread (I removed the last 's')

because it returns the info of a single thread.

> +#
> +# Returns threadInfo about the thread specified by name
> +#
> +# data: migration thread name
> +#
> +# returns: information about the specified thread
> +#
> +# Since: 7.2
> +##
> +{ 'command': 'query-migrationthreads',
> +  'data': { 'name': 'str' },
> +  'returns': 'MigrationThreadInfo' }
> +
>  ##
>  # @snapshot-save:
>  #

And leaves the @query-migrationthreads name for something in the spirit of

> +{ 'command': 'query-migrationthreads',
> +  'returns': ['str'] }

That returns all the migration threads names.

Or perhaps even

> +{ 'command': 'query-migrationthreads',
> +  'returns': ['MigrationThreadInfo'] }

And call it a day?

Later, Juan.


