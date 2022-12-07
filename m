Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D85F0645804
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 11:37:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2rmv-00020R-75; Wed, 07 Dec 2022 05:36:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1p2rma-0001kl-Vt; Wed, 07 Dec 2022 05:36:12 -0500
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1p2rmW-0005yi-71; Wed, 07 Dec 2022 05:36:08 -0500
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 4D5385E977;
 Wed,  7 Dec 2022 13:35:50 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:7232::1:25] (unknown
 [2a02:6b8:b081:7232::1:25])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 mZVlK20QGeA1-Zd8yFxGx; Wed, 07 Dec 2022 13:35:49 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1670409349; bh=S2B4wDUhI1TT1kVVQE8KrIMmOruVy430dAe58rwkqHc=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=wmOCRdTSG07h4bISJt1sLOHEWewpLjdxThjYz2A5k2SiSEW8pXD3ErAVPTHidNfr2
 FBrI558e2lNnXPhXVlIAbtW+z5IX4TDEZGmBd7q//jipg4HoYzc7mslME4uxhOhTZV
 Y9v6NvKLL+0L588ccNJD3jeFjKFpV0j9zApNnquA=
Authentication-Results: iva4-f06c35e68a0a.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <0996af1e-4310-941e-86f1-d98e01ac4aee@yandex-team.ru>
Date: Wed, 7 Dec 2022 13:35:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH for-8.0] ui/vnc: fix bad address parsing
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: kraxel@redhat.com, qemu-trivial@nongnu.org,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
References: <20221206192334.65012-1-vsementsov@yandex-team.ru>
 <6fb5f423-cb24-6214-e776-e8c27920240c@linaro.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <6fb5f423-cb24-6214-e776-e8c27920240c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.27,
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

On 12/6/22 23:12, Philippe Mathieu-Daudé wrote:
> On 6/12/22 20:23, Vladimir Sementsov-Ogievskiy wrote:
>> IF addrstr == "[" and websocket is true, hostlen becomes 0 and we try
>> to access addrstr[hostlen-1] which is bad idea.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
>> ---
>>   ui/vnc.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/ui/vnc.c b/ui/vnc.c
>> index 88f55cbf3c..8830bfe382 100644
>> --- a/ui/vnc.c
>> +++ b/ui/vnc.c
>> @@ -3765,7 +3765,7 @@ static int vnc_display_get_address(const char *addrstr,
>>           addr->type = SOCKET_ADDRESS_TYPE_INET;
>>           inet = &addr->u.inet;
>> -        if (addrstr[0] == '[' && addrstr[hostlen - 1] == ']') {
>> +        if (hostlen >= 2 && addrstr[0] == '[' && addrstr[hostlen - 1] == ']') {
>>               inet->host = g_strndup(addrstr + 1, hostlen - 2);
>>           } else {
>>               inet->host = g_strndup(addrstr, hostlen);
> 
> If addrstr is "[" then inet->host ends up being "[" too now, right?
> 
> I was pretty sure we had a helper for that, but can't find any.

that's all a bit strange, let's add a bit of debugging:
diff --git a/ui/vnc.c b/ui/vnc.c
index 88f55cbf3c..b1d463e67a 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -3770,6 +3770,7 @@ static int vnc_display_get_address(const char *addrstr,
          } else {
              inet->host = g_strndup(addrstr, hostlen);
          }
+        printf("%s: websocket: %d, host: %s, port: %s\n", __func__, websocket, inet->host, port);
          /* plain VNC port is just an offset, for websocket
           * port is absolute */
          if (websocket) {


then:



./build/qemu-system-x86_64 -vnc [
qemu-system-x86_64: -vnc [: no vnc port specified


./build/qemu-system-x86_64 -vnc [,websocket
qemu-system-x86_64: -vnc [,websocket: warning: short-form boolean option 'websocket' deprecated
Please use websocket=on instead
qemu-system-x86_64: -vnc [,websocket: no vnc port specified



./build/qemu-system-x86_64 -vnc [:0,websocket
qemu-system-x86_64: -vnc [:0,websocket: warning: short-form boolean option 'websocket' deprecated
Please use websocket=on instead
vnc_display_get_address: websocket: 0, host: [, port: 0
vnc_display_get_address: websocket: 1, host: , port: on
qemu-system-x86_64: -vnc [:0,websocket: address resolution failed for [:5900: Name or service not known

./build/qemu-system-x86_64 -vnc [:0,websocket=on
vnc_display_get_address: websocket: 0, host: [, port: 0
vnc_display_get_address: websocket: 1, host: , port: on
qemu-system-x86_64: -vnc [:0,websocket=on: address resolution failed for [:5900: Name or service not known


so, "on" is treated as address string? (aha, that's OK, and it's parsed later in the code)

./build/qemu-system-x86_64 -vnc :0,websocket=[
vnc_display_get_address: websocket: 0, host: , port: 0
we are going to do bad thing!
vnc_display_get_address: websocket: 1, host: , port: [
qemu-system-x86_64: -vnc :0,websocket=[: address resolution failed for :[: Servname not supported for ai_socktype


-- 
Best regards,
Vladimir


