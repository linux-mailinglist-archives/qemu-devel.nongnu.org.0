Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 463313388F4
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 10:48:48 +0100 (CET)
Received: from localhost ([::1]:52784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKePX-0003EL-9k
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 04:48:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKeNK-0001i1-Pa
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:46:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49719)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lKeNG-0001u9-Bv
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:46:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615542385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yfLv9mEia/AMXlg7Bf7+axJbY5WX6hrbXYV2jhW8ODA=;
 b=EaAA9xsrfLuNuUIp3rwzWTGcNdHXOhs4x78+zc6RQyRB/TZ5weaRHZ4THP47IL8+JDCeG4
 e+LrTj58253B2eD174G6ZqAEysdYHtJYesA+6gso0UvmJTNRljz+YBteqV9NSQGNkQr6Qo
 neFRFDURmOEyiuJ6qdgmq2mGfZWf4Q8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-iQtXSz3FPwWP8FmaHNWf2w-1; Fri, 12 Mar 2021 04:46:24 -0500
X-MC-Unique: iQtXSz3FPwWP8FmaHNWf2w-1
Received: by mail-wr1-f70.google.com with SMTP id f3so10895442wrt.14
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 01:46:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yfLv9mEia/AMXlg7Bf7+axJbY5WX6hrbXYV2jhW8ODA=;
 b=h3WzxOF5sV/8M5AGJJBgq639V0Gs9IdeVx17YPWA+O9OOuuPJqeL1BB6kJNnKzQ6e6
 ysejceLWGc/LxbVyTEtPCXb++1HLZiY1ExE/8PgU8/CcnEp591QmnKnWtQYNuzLOkd5M
 invT1oNSmv/Qcc7LUVyFAukb65Nh6usahGQca4k05K3jWyh6RUb5miV+kerfSQwmwxwG
 8U7k4JJxAeAnVDa8W74oIvRB9rGvH+SN62tpmliJ3cm6abYH7G7mzyi0jF3mm02na0Ow
 3WKnXtABeQzZxmAbRJ7zaPDV+NkJW6Ayy8nh9dQLbkbX9dX7l3A+L1qSYr6B++hu7XMf
 cerQ==
X-Gm-Message-State: AOAM533nZCtzsz9nCc+bWo9AgRn3RweUjdUBvkgXk8QidYZNwrFqz+4S
 gSc80ER7YhCmZxbH7o0Xk9QQsI5ao/2dDtfWnDHtKRuX1gesOAyQyAAvtLXHk+sPlTmG1liZcPi
 8HGI/sA9WqDB5SFFx0mmu8n5UTboDyDzmHd0gNIDIWdc9OGpQBMTng8TfFXehmHb6AIo=
X-Received: by 2002:adf:ea47:: with SMTP id j7mr12640422wrn.377.1615542382917; 
 Fri, 12 Mar 2021 01:46:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzuo0GEd7Gt5j2NmSxxWCdGe8MnsveJuqNqp3VOKHAmygupn3f3Pgjd5md3FcvvN4frQ9/4NQ==
X-Received: by 2002:adf:ea47:: with SMTP id j7mr12640406wrn.377.1615542382688; 
 Fri, 12 Mar 2021 01:46:22 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id 21sm1599176wme.6.2021.03.12.01.46.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Mar 2021 01:46:22 -0800 (PST)
To: Claudio Fontana <cfontana@suse.de>
References: <bdc8dbaf-8d63-833a-3e57-7e823a321486@suse.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: all class init functions for all types in QEMU are called in
 select_machine(). Expected?
Message-ID: <b852304c-2123-f84f-2667-3682e7f48569@redhat.com>
Date: Fri, 12 Mar 2021 10:46:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <bdc8dbaf-8d63-833a-3e57-7e823a321486@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/03/21 10:31, Claudio Fontana wrote:
> Hello Paolo and all,
> 
> while debugging a class init ordering issue, I noticed that
> 
> _all_ class init functions for all types registered in the QEMU QOM are called in select_machine().
> Expected?
> 
> In particular it happens here:
> 
> static MachineClass *select_machine(void)
> {
>      GSList *machines = object_class_get_list(TYPE_MACHINE, false);
> 
> 
> object_class_get_list() ->
>    object_class_foreach() ->
>      g_hash_table_foreach() ->
>        object_class_foreach_tramp ->
>          type_initialize(type);
> 
> Is this really desired? It looks suspect to me.

It is not a problem because class_init should be idempotent.  Changing 
QEMU to not do this would not be impossible, but most likely not worth 
the effort.  To do this, I think one would have to reimplement all of 
object_class_dynamic_cast to operate on TypeInfos (so for example walk 
all interfaces in the type info instead of using class->interfaces).

> If not here, where should be the right place, for example, for CPU class inits to be called?

The first time they're used, upon a call to one of object_new, 
object_initialize, object_class_get_list or object_class_foreach.

> At the very least I would put a comment there around the beginning of select_machine() saying:
> 
> /* all types, all classes in QOM are initialized here, as a result of the object_class_get_list call */

No, it's just a side effect that is not (or should not) be visible.

Paolo


