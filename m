Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D575426897D
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Sep 2020 12:44:28 +0200 (CEST)
Received: from localhost ([::1]:58552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHlyF-0007Dw-Ux
	for lists+qemu-devel@lfdr.de; Mon, 14 Sep 2020 06:44:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kHlxa-0006oR-6r
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 06:43:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kHlxY-0002jg-8x
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 06:43:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600080223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fjn3HY1FFffLxs7m8clQ+NYqIFcUiG9xdC+qN/oZgkg=;
 b=O6gn4P/xbGV+WSWZ07zyR8inwaCYZnarurtkm9T6N8939bWoVm4LGusNv0thAKrfa1zxd6
 xasR2ywloDco3mIOOlrlbUwnahsvdfW+/EASMQDnY+ESkcotw9ZsitTec4NXilkDTt5hK5
 WpVNDbFisBrh2H1yO69KICi21jQ8aj4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-U8EMzhkaM3mUJy5VRMQecA-1; Mon, 14 Sep 2020 06:43:40 -0400
X-MC-Unique: U8EMzhkaM3mUJy5VRMQecA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D6D21007461;
 Mon, 14 Sep 2020 10:43:38 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-134.ams2.redhat.com [10.36.112.134])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1EC1527BC0;
 Mon, 14 Sep 2020 10:43:30 +0000 (UTC)
Subject: Re: [PATCH v8 16/27] cirrus: Building freebsd in a single short
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
References: <20200912224431.1428-1-luoyonggang@gmail.com>
 <20200912224431.1428-17-luoyonggang@gmail.com>
 <78c65c60-9598-97a2-0dc7-116c3c0f94a9@redhat.com>
 <401c7ac1-6575-1d77-40ef-a4ee4178711b@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <5c3d3bc4-75ff-8480-27cc-948bfa5072cb@redhat.com>
Date: Mon, 14 Sep 2020 12:43:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <401c7ac1-6575-1d77-40ef-a4ee4178711b@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/14 02:10:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.792,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Ed Maste <emaste@FreeBSD.org>, qemu-block@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Xie Changlong <xiechanglong.d@gmail.com>,
 Peter Lieven <pl@kamp.de>, Michael Roth <mdroth@linux.vnet.ibm.com>,
 Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Wen Congyang <wencongyang2@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/09/2020 10.50, Philippe Mathieu-Daudé wrote:
> On 9/14/20 9:27 AM, Thomas Huth wrote:
>> On 13/09/2020 00.44, Yonggang Luo wrote:
>>> This reverts commit 45f7b7b9f38f5c4d1529a37c93dedfc26a231bba
>>> ("cirrus.yml: Split FreeBSD job into two parts").
>>>
>>> freebsd 1 hour limit not hit anymore
>>>
>>> I think we going to a wrong direction, I think there is some tests a stall the test runner,
>>> please look at
>>> https://cirrus-ci.com/task/5110577531977728
>>> When its running properly, the consumed time are little, but when tests running too long,
>>> look at the cpu usage, the cpu usage are nearly zero. doesn't consuming time.
>>>
>>> And look at
>>> https://cirrus-ci.com/task/6119341601062912
>>>
>>> If the tests running properly, the time consuming are little
>>> We should not hide the error by split them
>>>
>>> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
>>> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
>>> Reviewed-by: Ed Maste <emaste@FreeBSD.org>
>>> ---
>>>  .cirrus.yml | 35 ++++++++---------------------------
>>>  1 file changed, 8 insertions(+), 27 deletions(-)
>>
>> I tried this a couple of times now, and currently the problem seems to
>> be gone, indeed. I'd still prefer to understand first why we have seen
>> the slowdown a couple of weeks ago, but if people agree that we should
>> revert the patch now, that's ok for me now, too.
> 
> Not sure if related (probably not as failure and not timeout),
> I hit this during the night:
> 
>   TEST    iotest-qcow2: 030 [fail]

No, that's a different (known) issue. See my patch on the list:

 [PATCH v2] iotests: Skip test_stream_parallel in test 030 when doing
"make check"

 Thomas


