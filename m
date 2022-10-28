Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFBF611168
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 14:31:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooOV5-0005U2-Jj; Fri, 28 Oct 2022 08:30:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ooOST-0002vQ-KG
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 08:27:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ooOSS-0003OQ-2N
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 08:27:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666960049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dAsUyYuFdhM40lGPlOk+YsP0nlR6oWTNzDPrRpYJnck=;
 b=RmXh10OYzoa24Y40SKg+gFqBTVSBIts74FsdSjE9TZQ0ShjHTa1zQRirVXbn2O0DFLywcO
 /VyWN3lGzXhVQsXeBiMYYO/s9TNDOmQGvKI6LevioKdLQVjwj1xUl5sIud5chkvp3Bl/3W
 HVG9tG+xhJFSjR1+006UpYFO9y7AGCU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-552-Ubz857p0NAK89muFu7KjHA-1; Fri, 28 Oct 2022 08:27:28 -0400
X-MC-Unique: Ubz857p0NAK89muFu7KjHA-1
Received: by mail-wr1-f69.google.com with SMTP id
 m24-20020adfa3d8000000b00236774fd74aso1131124wrb.8
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 05:27:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dAsUyYuFdhM40lGPlOk+YsP0nlR6oWTNzDPrRpYJnck=;
 b=jM4ZKXy5vNeMzigLqphZb/77wZKu6c9XLPCkUfsiV5MYAUWJtFPklFkO1z3flxkZ9f
 zaRoZkxW/0xkq5N5RaDC54ddwXoTYtUPBA68uATetN6ESRxEU3obtPZxgRC2Xc9aMxhi
 5seDdilCeKUpVpL0drc9o8INcDwF5/i9BmKZ0tkyOoeRVxuvLhQcDXWpM/Bo3shJRP3m
 S3SPytDZfjEFeML0TWUGhjwPcxGvTw3J0hRRgjJ1ErjRxKGeN7ie75I8n7m4SuY0g3Dl
 IErBCdtqk4M0Pp5zMJAG9h4WLP+Leb/GUEWh7XQZp1HNX+yntxiVTxGnjhfPJltJ77vy
 tlsg==
X-Gm-Message-State: ACrzQf06gf8JvQJYvcrUzTOhc8CNn01n8/SHLRDR06e/cQGXUhXzpQBr
 HH4cKzsDSBrYmVh0BR7fi1Y2SVEaSBNtcFoLnCpitxX4iyPgLlHw5wLO5Gj8sYhNwrjw5gwgv9T
 XoTVFcqunEsACqMw=
X-Received: by 2002:a5d:6da9:0:b0:22e:53bd:31c1 with SMTP id
 u9-20020a5d6da9000000b0022e53bd31c1mr37691274wrs.358.1666960042149; 
 Fri, 28 Oct 2022 05:27:22 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5ImfFQQtr0sgm64oBGdFB/3D18Yzmh0fc5/GuH+vNiPSDLF/X1oaImFQ2d/U7G1iUtJVDmQw==
X-Received: by 2002:a5d:6da9:0:b0:22e:53bd:31c1 with SMTP id
 u9-20020a5d6da9000000b0022e53bd31c1mr37691263wrs.358.1666960041970; 
 Fri, 28 Oct 2022 05:27:21 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-14.web.vodafone.de.
 [109.43.177.14]) by smtp.gmail.com with ESMTPSA id
 hg9-20020a05600c538900b003a83ca67f73sm3960160wmb.3.2022.10.28.05.27.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 05:27:21 -0700 (PDT)
Message-ID: <c200713a-2fe9-b3be-a8a0-c73e1b678968@redhat.com>
Date: Fri, 28 Oct 2022 14:27:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] 9pfs: fix missing sys/mount.h include
Content-Language: en-US
To: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@gmail.com>,
 Warner Losh <imp@bsdimp.com>, Bin Meng <bin.meng@windriver.com>
References: <E1ooNWu-0002oC-76@lizzy.crudebyte.com>
 <53df074a-c938-cbe5-caca-a0c6a7cbd3e7@redhat.com> <7476627.JHTLl5x3NE@silver>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <7476627.JHTLl5x3NE@silver>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 28/10/2022 14.14, Christian Schoenebeck wrote:
> On Friday, October 28, 2022 1:42:34 PM CEST Thomas Huth wrote:
>> On 28/10/2022 13.21, Christian Schoenebeck wrote:
>>> Fixes the following build error:
>>>
>>>     fsdev/file-op-9p.h:156:56: error: declaration of 'struct statfs' will
>>>     not be visible outside of this function [-Werror,-Wvisibility]
>>>       int (*statfs)(FsContext *s, V9fsPath *path, struct statfs *stbuf);
>>>                                                          ^
>>>
>>> As Windows neither has statfs, nor sys/mount.h, don't include it there.
>>>
>>> Fixes: 684f91203439 ("tests/9p: split virtio-9p-test.c ...")
>>> Link: https://lore.kernel.org/all/2690108.PsDodiG1Zx@silver/
>>> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
>>> ---
>>>    fsdev/file-op-9p.h | 2 ++
>>>    1 file changed, 2 insertions(+)
>>>
>>> diff --git a/fsdev/file-op-9p.h b/fsdev/file-op-9p.h
>>> index 4997677460..700f1857b4 100644
>>> --- a/fsdev/file-op-9p.h
>>> +++ b/fsdev/file-op-9p.h
>>> @@ -24,6 +24,8 @@
>>>    #endif
>>>    #ifdef CONFIG_DARWIN
>>>    # include <sys/param.h>
>>> +#endif
>>> +#ifndef CONFIG_WIN32
>>>    # include <sys/mount.h>
>>>    #endif
>>
>> Do you feel confident that this will also work on other exotic systems?
>> (e.g. does it work with "make vm-build-haiku.x86_64" ?)
>> Otherwise it might be better to add a meson.build test for this header instead.
> 
> 9pfs only supports Linux and macOS ATM, and Windows being WIP.
Ok, makes sense now, thanks!

  Thomas


