Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A17E57B799
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 15:37:59 +0200 (CEST)
Received: from localhost ([::1]:56180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE9tm-0002XI-EN
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 09:37:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oE9sF-0000gl-QJ; Wed, 20 Jul 2022 09:36:24 -0400
Received: from forwardcorp1p.mail.yandex.net ([77.88.29.217]:57728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oE9sA-0003WT-TC; Wed, 20 Jul 2022 09:36:21 -0400
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 104D62E13E6;
 Wed, 20 Jul 2022 16:36:07 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:b715::1:28] (unknown
 [2a02:6b8:b081:b715::1:28])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 hAX15q2nlH-a5OaOOST; Wed, 20 Jul 2022 13:36:06 +0000
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1658324166; bh=AYs7fcZM9/1mvnyttHtCjweb6LwJbqOPjWUfXjTdlRs=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=0se55a15snqWRemd1Sbnct7FxPdKXFo20ZI9nLQ4RVhYGd9lvyf6G/Im10gDEivFI
 tKtOFnMGHMxrdVhNJNWTfjsRqh5F8EeCU1k8JV93jonwYuc1s0Jc9AGmmzgoS8hXeG
 AIvlLJTSh1vFc3z3gj6kCRc13Ku3/mSDoTkin3bo=
Authentication-Results: iva4-f06c35e68a0a.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <effd77ae-ac1f-ed59-943a-bf874ae39644@yandex-team.ru>
Date: Wed, 20 Jul 2022 16:36:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [RFC PATCH 2/8] transactions: add tran_add_back
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>, qemu-block@nongnu.org
References: <20220712211911.1302836-1-eesposit@redhat.com>
 <20220712211911.1302836-3-eesposit@redhat.com>
 <5f17518a-a2ae-8e6e-6864-84b13058d5d8@redhat.com>
 <d65a18ba-0ec8-3b59-a203-a4c335bedbc3@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <d65a18ba-0ec8-3b59-a203-a4c335bedbc3@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=77.88.29.217;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 7/18/22 19:20, Paolo Bonzini wrote:
> On 7/14/22 17:13, Hanna Reitz wrote:
>>> that we want to run before the others but still only when invoking
>>> finalize/commit/abort.
>>
>> I don’t understand this yet (but perhaps it’ll become clearer with the following patches); doesn’t the new function do the opposite? I.e., basically add some clean-up that’s only used after everything else?
> 
> I agree about the commit message being incorrect, but is there any reason why transactions work LIFO by default?  Is there anything that requires that behavior?
> 

Yes. On abort() we want to rollback actions in reverse order. When we create _abort() part of some action we assume that current graph state is exactly the same like it was after _prepare() call, otherwise it just will not work. That means that all actions called _after_ action X, are already rolled-back when we call X_abort().

And keeping that in mind I'm afraid of implementing a possibility to break this order..

Note also, that in block transaction API, most of the action is usually done in _prepare(), so that next action in transaction can rely on result of previous action.



-- 
Best regards,
Vladimir

