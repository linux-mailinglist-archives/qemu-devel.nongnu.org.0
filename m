Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5833A6EA773
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 11:45:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppnJc-0001r8-2a; Fri, 21 Apr 2023 05:44:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ppnJZ-0001qT-BR
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:44:25 -0400
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ppnJX-0004sy-Fx
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 05:44:25 -0400
Received: from mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 [IPv6:2a02:6b8:c0c:7f29:0:640:9a2b:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 1005360E5C;
 Fri, 21 Apr 2023 12:44:16 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:8816::1:4] (unknown
 [2a02:6b8:b081:8816::1:4])
 by mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id FibfIS1OnuQ0-m4uOlRO4; Fri, 21 Apr 2023 12:44:15 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1682070255; bh=q/SKRoHMZ6d6GYhTmnQ8NRWDVXWufDeR6FTUBUGV1ik=;
 h=In-Reply-To:From:Date:References:To:Subject:Message-ID;
 b=E3Mw9hd3o1g7NGPomUvjLEFfoBgH+FrKdq7dR6cWXDqV/Lx5EpsqJ8RNGJiQI7Pw1
 8PRalSFjM4pM+Flpyo37HsvW+ZWEu5d39pecoaKF6hhjwywO63ogQmBnzP7Fl3yKOL
 kVGwHoj/ZSDdj0F2j1DJgkruifx8p9Mgac6xw9oQ=
Authentication-Results: mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <1e1cac26-50fa-f2a9-641b-eafff9575b77@yandex-team.ru>
Date: Fri, 21 Apr 2023 12:44:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] vnc: avoid underflow when accessing user-provided address
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20230330124424.40610-1-pbonzini@redhat.com>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20230330124424.40610-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.669,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 30.03.23 15:44, Paolo Bonzini wrote:
> If hostlen is zero, there is a possibility that addrstr[hostlen - 1]
> underflows and, if a closing bracked is there, hostlen - 2 is passed
> to g_strndup() on the next line.  If websocket==false then
> addrstr[0] would be a colon, but if websocket==true this could in
> principle happen.
> 
> Fix it by checking hostlen.
> 
> Reported by Coverity.
> 
> Signed-off-by: Paolo Bonzini<pbonzini@redhat.com>

I've already sent a similar patch, yes, but let's finally merge any:)

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

-- 
Best regards,
Vladimir


