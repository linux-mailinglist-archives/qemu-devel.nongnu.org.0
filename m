Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE069324616
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 23:06:42 +0100 (CET)
Received: from localhost ([::1]:54994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lF2Ir-0006GC-9i
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 17:06:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <geoff@hostfission.com>)
 id 1lF2HB-0005fM-Ce
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 17:04:57 -0500
Received: from mail1.hostfission.com ([139.99.139.48]:54972)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <geoff@hostfission.com>) id 1lF2H9-0003kd-Ek
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 17:04:57 -0500
Received: from www1.hostfission.com (www1.hostfission.com [139.99.139.52])
 by mail1.hostfission.com (Postfix) with ESMTP id A6F664B787;
 Thu, 25 Feb 2021 09:04:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=hostfission.com;
 s=mail; t=1614204287;
 bh=HuYbIPWzTrJ4sJl4kjdsFZ3JbpFi0LlRiX9FUooRIk4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=xpyIaHkTS/Zb+wr/ZLCCwl1jPBw8EgprdeJdDs7yJRIF5fD8Z/WRXu1rkjn++HJ5h
 gd8rVnLJ1bcIo48dnt+onF2vKMp3Yp0BDzsR/gEJjRRZMyE9UoznBwBtWeZ99fBa5A
 AQsha3Dd47/4X2otphT1y78cBqJlbX6Lyvq9GKBA=
Received: from mail.hostfission.com (www1.hostfission.com [127.0.0.1])
 by www1.hostfission.com (Postfix) with ESMTP id 91D058C611;
 Thu, 25 Feb 2021 09:04:47 +1100 (AEDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Thu, 25 Feb 2021 09:04:47 +1100
From: Geoffrey McRae <geoff@hostfission.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Jos=C3=A9_Pekkarinen?=
 <koalinux@gmail.com>, kraxel@redhat.com
Subject: Re: [PATCH v2] Autoconnect jack ports by default
In-Reply-To: <3407243.daszWApDLn@silver>
References: <20210224191927.19271-1-koalinux@gmail.com>
 <3407243.daszWApDLn@silver>
Message-ID: <5694e258e36c6623aae5465aafeec951@hostfission.com>
X-Sender: geoff@hostfission.com
User-Agent: Roundcube Webmail/1.3.15
Received-SPF: pass client-ip=139.99.139.48; envelope-from=geoff@hostfission.com;
 helo=mail1.hostfission.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This goes against how all standard jack clients work, a new jack client 
should not auto-connect at all unless explicitly configured to as if 
there is an existing audio diagram configured (which is 99% of the time) 
it will cause unexpected/undesired behavior.

Jack is not supposed to be an 'automatic' system, it's the 
responsibility of the patch bay software to route connections.

The auto-connect feature exists to allow the jack audiodev to re-connect 
a broken connection when the jack device restarts/reconnects.

On 2021-02-25 06:39, Christian Schoenebeck wrote:
> On Mittwoch, 24. Februar 2021 20:19:27 CET José Pekkarinen wrote:
>> This patch provides a default value to connect
>> jack ports when the user don't specify connect-ports.
>> 
>> Buglink: https://bugs.launchpad.net/qemu/+bug/1908832
>> 
>> Signed-off-by: José Pekkarinen <koalinux@gmail.com>
>> ---
>>  audio/jackaudio.c | 15 ++++++++++++---
>>  1 file changed, 12 insertions(+), 3 deletions(-)
>> 
>> diff --git a/audio/jackaudio.c b/audio/jackaudio.c
>> index 3031c4e29b..0a87d5e23a 100644
>> --- a/audio/jackaudio.c
>> +++ b/audio/jackaudio.c
>> @@ -369,14 +369,23 @@ static size_t qjack_read(HWVoiceIn *hw, void 
>> *buf,
>> size_t len)
>> 
>>  static void qjack_client_connect_ports(QJackClient *c)
>>  {
>> -    if (!c->connect_ports || !c->opt->connect_ports) {
>> +    if (!c->connect_ports) {
>>          return;
>>      }
>> 
>>      c->connect_ports = false;
>>      const char **ports;
>> -    ports = jack_get_ports(c->client, c->opt->connect_ports, NULL,
>> -        c->out ? JackPortIsInput : JackPortIsOutput);
>> +    if (c->out) {
>> +        ports = jack_get_ports(c->client,
>> +            c->opt->connect_ports ? c->opt->connect_ports
>> +                : "system:playback_.*",
>> +            NULL, JackPortIsInput);
>> +    } else {
>> +        ports = jack_get_ports(c->client,
>> +            c->opt->connect_ports ? c->opt->connect_ports
>> +                : "system:capture_.*",
>> +            NULL, JackPortIsOutput);
>> +    }
>> 
>>      if (!ports) {
>>          return;
> 
> Looks fine to me now.
> 
> Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> 
> Thanks José!
> 
> Best regards,
> Christian Schoenebeck

