Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A37CA2121AD
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jul 2020 13:01:37 +0200 (CEST)
Received: from localhost ([::1]:44606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jqwyG-0000QM-Ng
	for lists+qemu-devel@lfdr.de; Thu, 02 Jul 2020 07:01:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1jqwwv-0007rj-EG
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 07:00:13 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:49513
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1jqwws-0007Za-PB
 for qemu-devel@nongnu.org; Thu, 02 Jul 2020 07:00:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593687610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aI6PYttwNilYjZ2ALeBuL9ZRTj6+8LRiyoLJBAXmHgY=;
 b=WERHYnM3fakuIp8QQXwsEXz0pQsxKibO3uzjk6Q3HQ2jLGTQhAzSmrWrNgPKrcpnlH5UqI
 uE3Wu94ur8RatOd/sqRAbAiQcC5SOKtkp0ABI/Pz22Sg3Vq795pv2PUpG/9UCkItj7KYYG
 U2wIrRUFjs1U4oV+iVC/ahx/9bn1uQg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-MNFG4FmHNSS3msfBWT29RA-1; Thu, 02 Jul 2020 07:00:08 -0400
X-MC-Unique: MNFG4FmHNSS3msfBWT29RA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9896010059A9
 for <qemu-devel@nongnu.org>; Thu,  2 Jul 2020 11:00:07 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-113-177.ams2.redhat.com
 [10.36.113.177])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 587CA73FEF;
 Thu,  2 Jul 2020 11:00:03 +0000 (UTC)
Subject: Re: [PATCH v10 0/5] fw_cfg: Add FW_CFG_DATA_GENERATOR; crypto: Add
 tls-cipher-suites
To: =?UTF-8?Q?Daniel_P._Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20200623172726.21040-1-philmd@redhat.com>
 <20200701103155.GE1427561@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <b450f105-59a6-7502-93a0-fb9cf26e8ad2@redhat.com>
Date: Thu, 2 Jul 2020 13:00:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Firefox/52.0 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200701103155.GE1427561@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/02 04:18:28
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/01/20 12:31, Daniel P. Berrangé wrote:
> On Tue, Jun 23, 2020 at 07:27:21PM +0200, Philippe Mathieu-Daudé wrote:
>> Hi,
>>
>> This series has 3 parts:
>>
>> - First we add the tls-cipher-suites object
>>
>> - We add the ability to QOM objects to produce data
>>   consumable by the fw_cfg device,
>>
>> - Then we let the tls-cipher-suites object implement
>>   the FW_CFG_DATA_GENERATOR interface.
>>
>> This is required by EDK2 'HTTPS Boot' feature [*] to tell
>> the guest which TLS ciphers it can use.
> 
> On my crypto side, the series is ready to merge.
> 
> The code is split 50/50 between crypto subsystem and firmware
> subsystem, so the question is who wants to merge it ?
> 
> If Laszlo wants to merge it, then consider the whole series
> to have   Acked-by: Daniel P. Berrangé <berrange@redhat.com>
> 
> If Laszlo wants me to merge it, then I'll just wait for him
> to give his Ack.
> 
> Soft-freeze is fast approaching in less than a week...

We should let Phil send a pull request. :)

Thanks!
Laszlo


