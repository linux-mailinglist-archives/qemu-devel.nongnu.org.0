Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B008F6DE467
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 20:56:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmJ9I-0001Yk-9j; Tue, 11 Apr 2023 14:55:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pmJ9G-0001YX-Hg; Tue, 11 Apr 2023 14:55:22 -0400
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pmJ9C-00049t-OM; Tue, 11 Apr 2023 14:55:22 -0400
Received: from mail-nwsmtp-smtp-corp-main-11.iva.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-11.iva.yp-c.yandex.net
 [IPv6:2a02:6b8:c0c:2cab:0:640:424b:0])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 214525F1CC;
 Tue, 11 Apr 2023 21:55:07 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:8023::1:f] (unknown
 [2a02:6b8:b081:8023::1:f])
 by mail-nwsmtp-smtp-corp-main-11.iva.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id 4ta6s10OmOs0-osB7kcmy; Tue, 11 Apr 2023 21:55:06 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1681239306; bh=HtyVPRC6lA96+vvP1oMSVi05o5RiulHEl3iOz65BxiQ=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=BneZkajdTkrJ/V+IPO1AmpTk7jyM877vVZJxLezIM0D8H5FlqSrbOROaIJir+0JkE
 VKAKh/GG3Rva3i9cMwDeFimA2ip4ZhbZda44tojremSvVueYdgpGwB1umnH8ZGmHzm
 XT7k/0s/wjLFbH2M8E2rL4jDZKtZZ96tLO9u223M=
Authentication-Results: mail-nwsmtp-smtp-corp-main-11.iva.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <8fba1afd-6f41-65ee-597d-54b6ca6ee918@yandex-team.ru>
Date: Tue, 11 Apr 2023 21:55:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 2/4] block: Collapse padded I/O vecs exceeding IOV_MAX
To: Hanna Czenczek <hreitz@redhat.com>, qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>
References: <20230411173418.19549-1-hreitz@redhat.com>
 <20230411173418.19549-3-hreitz@redhat.com>
Content-Language: en-US
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20230411173418.19549-3-hreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.17,
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

On 11.04.23 20:34, Hanna Czenczek wrote:
> When processing vectored guest requests that are not aligned to the
> storage request alignment, we pad them by adding head and/or tail
> buffers for a read-modify-write cycle.
> 
> The guest can submit I/O vectors up to IOV_MAX (1024) in length, but
> with this padding, the vector can exceed that limit.  As of
> 4c002cef0e9abe7135d7916c51abce47f7fc1ee2 ("util/iov: make
> qemu_iovec_init_extended() honest"), we refuse to pad vectors beyond the
> limit, instead returning an error to the guest.
> 
> To the guest, this appears as a random I/O error.  We should not return
> an I/O error to the guest when it issued a perfectly valid request.
> 
> Before 4c002cef0e9abe7135d7916c51abce47f7fc1ee2, we just made the vector
> longer than IOV_MAX, which generally seems to work (because the guest
> assumes a smaller alignment than we really have, file-posix's
> raw_co_prw() will generally see bdrv_qiov_is_aligned() return false, and
> so emulate the request, so that the IOV_MAX does not matter).  However,
> that does not seem exactly great.
> 
> I see two ways to fix this problem:
> 1. We split such long requests into two requests.
> 2. We join some elements of the vector into new buffers to make it
>     shorter.
> 
> I am wary of (1), because it seems like it may have unintended side
> effects.
> 
> (2) on the other hand seems relatively simple to implement, with
> hopefully few side effects, so this patch does that.
> 
> To do this, the use of qemu_iovec_init_extended() in bdrv_pad_request()
> is effectively replaced by the new function bdrv_create_padded_qiov(),
> which not only wraps the request IOV with padding head/tail, but also
> ensures that the resulting vector will not have more than IOV_MAX
> elements.  Putting that functionality into qemu_iovec_init_extended() is
> infeasible because it requires allocating a bounce buffer; doing so
> would require many more parameters (buffer alignment, how to initialize
> the buffer, and out parameters like the buffer, its length, and the
> original elements), which is not reasonable.
> 
> Conversely, it is not difficult to move qemu_iovec_init_extended()'s
> functionality into bdrv_create_padded_qiov() by using public
> qemu_iovec_* functions, so that is what this patch does.
> 
> Because bdrv_pad_request() was the only "serious" user of
> qemu_iovec_init_extended(), the next patch will remove the latter
> function, so the functionality is not implemented twice.
> 
> Buglink:https://bugzilla.redhat.com/show_bug.cgi?id=2141964
> Signed-off-by: Hanna Czenczek<hreitz@redhat.com>

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

-- 
Best regards,
Vladimir


