Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2ABB62F318
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 11:58:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovz3s-0002Ce-Av; Fri, 18 Nov 2022 05:57:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ovz3p-0002Bp-O5
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 05:57:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ovz3n-0005Oj-Hb
 for qemu-devel@nongnu.org; Fri, 18 Nov 2022 05:57:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668769046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oBIxByXGS4Hm5BQKHZL5NOAH0ihXHx1o+pZgwD5uaAw=;
 b=E+i4G4cdy+Px8+P6EwJPhborakUYzzkK8602/h9QBCxQNh3zo84NcvGyNes6ztLdI/6Bgj
 upx0xkS03b506/Dfk7Hf6TLOYbo1XsmiQtZjikhwc63KMKh0aJ8NNtvCfbm0cjs2jTbT1H
 2RNgZs899+OzwCEFJu7B+d9paiipGZw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-104-UwbfRP8kN7-4WBS3x7sYFg-1; Fri, 18 Nov 2022 05:57:25 -0500
X-MC-Unique: UwbfRP8kN7-4WBS3x7sYFg-1
Received: by mail-wr1-f72.google.com with SMTP id
 d23-20020adfa417000000b002364a31b7c9so1436344wra.15
 for <qemu-devel@nongnu.org>; Fri, 18 Nov 2022 02:57:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oBIxByXGS4Hm5BQKHZL5NOAH0ihXHx1o+pZgwD5uaAw=;
 b=1rY5RG6tZEba8r/gK7PBvqeeWsH5q9fYMktFWuxZS2ZSLpOQw0MxAAoSJGyFrWRiZo
 3EFpE28OwD4WgjogkHKUtve2c52Ad9sUtoesfeIy/OrOU22QC4ECrzlPs/nEHQN4JvE0
 xfZtM0YNnJFVG5zrwBjeVEYuAHPaE4meBuxBamWTVUSvwY0rXMi5Gq94Iv2K82MyuaRJ
 45xLn8dtudZd7b5vu9uz5Cw57nCB/qjO8NIH1CyGEFg3k+JrPyPEBhAdhdGS0wvm+1f/
 +elcPFcggWfaUQcr2o9t+d0qia0TIA1sZGQMgbcNVeHOLurToUMX3042zuptLvCvN34D
 V+Rg==
X-Gm-Message-State: ANoB5pkJ5zXwPdy8dlJ3eenVBAxJcTJH32HxVqOUIgscRdrcXkyb2Hu8
 z7eky1qvMZi0GE+KmL3BBdSmOrfJc7ZcMP2DaLGhxFCaxI/zz0zLySrFdtUD4+B7/otJ+ZLNZOh
 Wxcc9oz1hODFqvyE=
X-Received: by 2002:adf:b342:0:b0:236:62ce:3db with SMTP id
 k2-20020adfb342000000b0023662ce03dbmr3938466wrd.687.1668769043827; 
 Fri, 18 Nov 2022 02:57:23 -0800 (PST)
X-Google-Smtp-Source: AA0mqf67VrFcOBz227guj/X14Vlu7lS50Rha/CXIXJUsMqay0v558IqF8dtod6ZEIFrkK3UNsoXIUQ==
X-Received: by 2002:adf:b342:0:b0:236:62ce:3db with SMTP id
 k2-20020adfb342000000b0023662ce03dbmr3938434wrd.687.1668769043513; 
 Fri, 18 Nov 2022 02:57:23 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 w3-20020a5d6803000000b00228d67db06esm3290970wru.21.2022.11.18.02.57.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Nov 2022 02:57:22 -0800 (PST)
Message-ID: <e218aa44-6c49-d53f-d377-58a90a84db46@redhat.com>
Date: Fri, 18 Nov 2022 11:57:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 00/15] Protect the block layer with a rwlock: part 3
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Ari Sundholm <ari@tuxera.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Stefan Weil <sw@weilnetz.de>, Fam Zheng <fam@euphon.net>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, Peter Lieven <pl@kamp.de>,
 Eric Blake <eblake@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Alberto Garcia <berto@igalia.com>,
 Ilya Dryomov <idryomov@gmail.com>, Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 "Richard W.M. Jones" <rjones@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org,
 integration@gluster.org
References: <20221116140730.3056048-1-eesposit@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20221116140730.3056048-1-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/16/22 15:07, Emanuele Giuseppe Esposito wrote:
> Here we introduce generated_co_wrapper_simple, a simplification of g_c_w that
> only considers the case where the caller is not in a coroutine.
> This simplifies and clarifies a lot when the caller is a coroutine or not, and
> in the future will hopefully replace g_c_w.

This is a good idea!

Just one thing, though it belongs more in the two series which 
introduced generated_co_wrapper_simple and generated_co_wrapper_blk - I 
would make this the "official" wrapper.  So perhaps:

- generated_co_wrapper_simple -> coroutine_wrapper
- generated_co_wrapper_blk -> coroutine_wrapper_mixed
- generated_co_wrapper -> coroutine_wrapper_mixed_bdrv

?  It is not clear to me yet if you will have bdrv_* functions that take 
the rdlock as well - in which case however coroutine_wrapper_bdrv would 
not be hard to add.

Even without looking at the lock, the three series are going in the 
right direction of ultimately having more "simple" coroutine wrappers at 
the blk_* level and more coroutine functions (ultimately less wrappers, 
too) at the bdrv_* level.

Paolo


