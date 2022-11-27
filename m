Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE06639C59
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Nov 2022 19:29:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozMO7-0002Cr-MM; Sun, 27 Nov 2022 13:28:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1ozMO3-0002CI-1n
 for qemu-devel@nongnu.org; Sun, 27 Nov 2022 13:28:20 -0500
Received: from mail.weilnetz.de ([37.120.169.71]
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1ozMO0-0001sH-H3
 for qemu-devel@nongnu.org; Sun, 27 Nov 2022 13:28:18 -0500
Received: from [172.31.1.192] (p5b0906f1.dip0.t-ipconnect.de [91.9.6.241])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 63A22DA0EB6;
 Sun, 27 Nov 2022 19:28:10 +0100 (CET)
Message-ID: <bb8107e2-7bb7-ee7e-6c2f-fd1a47939527@weilnetz.de>
Date: Sun, 27 Nov 2022 19:28:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
To: Stefan Hajnoczi <stefanha@gmail.com>
Cc: qemu-devel@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20221126152507.283271-1-sw@weilnetz.de>
 <20221126152507.283271-5-sw@weilnetz.de>
 <CAJSP0QX-Uo3y_DD7qvWZqBuVdS+LTnk=4jp6jWf9e6T38S06Bg@mail.gmail.com>
Subject: Re: [PATCH v3 for-7.2 4/6] libvhost-user: Add format attribute to
 local function vu_panic
In-Reply-To: <CAJSP0QX-Uo3y_DD7qvWZqBuVdS+LTnk=4jp6jWf9e6T38S06Bg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.257,
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
Reply-to:  Stefan Weil <sw@weilnetz.de>
From:  Stefan Weil via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 27.11.22 um 19:14 schrieb Stefan Hajnoczi:

> On Sat, 26 Nov 2022 at 10:25, Stefan Weil <sw@weilnetz.de> wrote:
>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>> Message-Id: <20220422070144.1043697-4-sw@weilnetz.de>
>> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
>> ---
>>   subprojects/libvhost-user/libvhost-user.c | 13 ++++++++++++-
>>   1 file changed, 12 insertions(+), 1 deletion(-)
> I would rather not merge something that can cause new build failures
> this late in the release cycle.
>
> If you respin, please make this a separate 8.0 patch.


It would only cause a build failure if there remained more format bugs, 
but the last ones were fixed in patch 3. I tested a build for 32 bit ARM 
(which previously failed without patch 3), and it works now.

But you are right, patch 4 is not release critical as it is not a bug 
fix (like the other ones), so not including it in 7.2 might be an option.

Stefan



