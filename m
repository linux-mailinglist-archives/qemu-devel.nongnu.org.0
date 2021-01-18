Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6046E2F97F2
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 03:51:06 +0100 (CET)
Received: from localhost ([::1]:40840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1KdF-0005ya-El
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 21:51:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l1Kbx-0005Sv-LB
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 21:49:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1l1Kbt-0005Ov-7j
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 21:49:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610938178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HiJxcB/KUWfm3a9qgfbG7vxuHoGTv5ppmNuOybEGSmE=;
 b=DIbuxQygno8eljeM+nnxwIH1QTwLZT0ZeQaZR0ovSpPwgjpyo/ga61STomTXBYg8/8F+YZ
 6fhZtQkTP5R79QtVVfi1/G6i8s+tQSgmOcMmY0rhXJnqO9LCJfAme7YltJp9aoYwvTn7O8
 P+rB/abp3GDeSw1ietfhzYvEGL6bztw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-146-KvbYZXAnNdiUWHM02ZrRpA-1; Sun, 17 Jan 2021 21:49:36 -0500
X-MC-Unique: KvbYZXAnNdiUWHM02ZrRpA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85D80800D53;
 Mon, 18 Jan 2021 02:49:35 +0000 (UTC)
Received: from [10.72.13.12] (ovpn-13-12.pek2.redhat.com [10.72.13.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BFC735D9CC;
 Mon, 18 Jan 2021 02:49:33 +0000 (UTC)
Subject: Re: [PATCH 0/1] net: Fix handling of id in netdev_add and netdev_del
To: Markus Armbruster <armbru@redhat.com>
References: <20201125100220.50251-1-armbru@redhat.com>
 <c9730775-08f6-322e-bb41-76ba957858e4@redhat.com>
 <87czy6jocq.fsf@dusky.pond.sub.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <53c2c245-f65c-6614-63ac-f15c1cd084aa@redhat.com>
Date: Mon, 18 Jan 2021 10:49:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87czy6jocq.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.189,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.252, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: yuri.benditovich@daynix.com, andrew@daynix.com, qemu-devel@nongnu.org,
 peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/1/15 下午9:56, Markus Armbruster wrote:
> Jason Wang <jasowang@redhat.com> writes:
>
>> On 2020/11/25 下午6:02, Markus Armbruster wrote:
>>> This is a regression fix, but the regression is already in 5.0.  I
>>> think it's too late for 5.2.  If I'm right, then the issue should be
>>> documented in the release notes (I can do that).
>>
>> Please do that and I've queued this for the next release.
> Ping?
>
>

Hi Markus:

I plan to send a pull request by the end of this week which should 
contain this series.

Thanks


