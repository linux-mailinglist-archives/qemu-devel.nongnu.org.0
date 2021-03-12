Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1253385CE
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 07:25:59 +0100 (CET)
Received: from localhost ([::1]:44386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKbFG-0003zz-RZ
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 01:25:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lKbCb-0002EJ-7A
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 01:23:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lKbCZ-0001HM-AS
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 01:23:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615530190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j6YV1/V89fSTJ9phlXpvTyC0V9+WxasCflts+Ckkp0k=;
 b=SaQ5JP2arHpx5oibW3NyEKB7ZJ6liEW4azF9OgI7YXBHDwMb2lFpc/Q1VgciRIDtZJxb7J
 zpDDpm8B5IrHxmQyeU3xnnAe9ZtdvcYcB3Wg6lSWNiWnKZjNH0MMvaoaAtuy6EcAAsNSVI
 vSLWaIonDLTs3Anpx28WncBgiHOYZxI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-CMlvpCcNNoe-6tVdOtwqXQ-1; Fri, 12 Mar 2021 01:23:07 -0500
X-MC-Unique: CMlvpCcNNoe-6tVdOtwqXQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DC41107ACCA;
 Fri, 12 Mar 2021 06:23:05 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-33.pek2.redhat.com
 [10.72.13.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 349D25D9F2;
 Fri, 12 Mar 2021 06:22:56 +0000 (UTC)
Subject: Re: [RFC PATCH v3 02/10] net: Pad short frames to minimum size before
 send from SLiRP/TAP
To: Bin Meng <bmeng.cn@gmail.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20210303191205.1656980-1-philmd@redhat.com>
 <20210303191205.1656980-3-philmd@redhat.com>
 <36123f35-06ab-d0da-37d2-6f8324e7f582@redhat.com>
 <CAFEAcA-REYy45Jmean0PhVerG9d_CpqgaFtxuWBMBrGDdyzvdA@mail.gmail.com>
 <edce617c-3591-a172-ad18-3bf138af26e0@redhat.com>
 <CAEUhbmU-KDUBADcX+bZHjH0thhddTSQ=Qtb56GztdRzPKE4Xhw@mail.gmail.com>
 <a26ef919-2e00-ae5b-c016-83e811ea5cdd@redhat.com>
 <CAEUhbmWdn8ZV1vNku_7dQfNg68xL6p3f-BCzq31jj5QAKmjj0w@mail.gmail.com>
 <CAEUhbmUY89OEpBpxCZzya=KKb1U5KBO=rPArn8yre7fmZe1q5A@mail.gmail.com>
 <CAFEAcA89xLMogR5-tUH-LW37Lr+py3LXQRgaO9_P8r8w-0gfzA@mail.gmail.com>
 <f682a3a0-cdb1-4746-ceed-c900c3f669ed@redhat.com>
 <CAFEAcA8_j6q8PweuoUVyW+BAGojZ8HdNnedrZwQNcBFWbn9Kbg@mail.gmail.com>
 <CAEUhbmW1pz0=TgwF12j5pQUaCGSLPumb5-yiy32PKfdTvvdpVQ@mail.gmail.com>
 <CAFEAcA8gwa2NGF2s3f=hO+EaVSJNDJrKz7xG60eSm68-CXf-mw@mail.gmail.com>
 <CAEUhbmWPWA_0wWBzacu1K2Kx+A2dgmFs89TQrbcG52mX=P5o7Q@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <4cc1bcb9-2288-ac03-4a5f-a1ebad4d34ef@redhat.com>
Date: Fri, 12 Mar 2021 14:22:54 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAEUhbmWPWA_0wWBzacu1K2Kx+A2dgmFs89TQrbcG52mX=P5o7Q@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 2021/3/11 6:27 下午, Bin Meng wrote:
> On Thu, Mar 11, 2021 at 6:22 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>> On Thu, 11 Mar 2021 at 09:58, Bin Meng <bmeng.cn@gmail.com> wrote:
>>> On Thu, Mar 11, 2021 at 5:43 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>>>> On Thu, 11 Mar 2021 at 03:01, Jason Wang <jasowang@redhat.com> wrote:
>>>>> And after a discussion 10 years ago [1]. Michael (cced) seems to want to
>>>>> keep the padding logic in the NIC itself (probably with a generic helper
>>>>> in the core). Since 1) the padding is only required for ethernet 2)
>>>>> virito-net doesn't need that (it can pass incomplete packet by design).
>>>> Like I said, we need to decide; either:
>>>>
>>>>   (1) we do want to support short packets in the net core:
>>>> every sender needs to either pad, or to have some flag to say
>>>> "my implementation can't pad, please can the net core do it for me",
>>>> unless they are deliberately sending a short packet. Every
>>>> receiver needs to be able to cope with short packets, at least
>>>> in the sense of not crashing (they should report them as a rx
>>>> error if they have that kind of error reporting status register).
>>>> I think we have mostly implemented our NIC models this way.
>>>>
>>>>   (2) we simply don't support short packets in the net core:
>>>> nobody (not NICs, not network backends) needs to pad, because
>>>> they can rely on the core to do it. Some existing senders and
>>>> receivers may have now-dead code to do their own padding which
>>>> could be removed.
>>>>
>>>> MST is advocating for (1) in that old thread. That's a coherent
>>>> position.
>>> But it's a wrong approach. As Edgar and Stefan also said in the old
>>> discussion thread, padding in the RX is wrong as real world NICs don't
>>> do this.
>> Neither option (1) nor option (2) involve padding in RX.
> Correct. What I referred to is the current approach used in many NIC
> modes, which is wrong, and we have to correct this.
>
>> Option (1) is:
>>   * no NIC implementation pads on TX, except as defined
>>     by whatever NIC-specific config registers or h/w behaviour
>>     might require (ie if the guest wants to send a short packet
>>     it can do that)
>>   * non-NIC sources like slirp need to pad on TX unless they're
>>     deliberately trying to send a short packet
>>   * all receivers of packets need to cope with being given a
>>     short packet; this is usually going to mean "flag it to the
>>     guest as an RX error", but exact behaviour is NIC-dependent
>>
> My patch series in RFC v2/v3 does almost exactly this option (1),
> except "flag it to the guest as an RX error".


Is it? You did it at net core instead of netdevs if I read the code 
correctly.


>
>> Option (2) is:
>>   * the net core code pads any packet that goes through it
>>   * no NIC implementation needs to pad on TX (it is harmless if they do)
>>   * non-NIC sources don't need to pad on TX
>>   * no receivers of packets need to cope with being given short packets
>>
>> Option 1 is what the real world does. Option 2 is a simplification
>> which throws away the ability to emulate handling of short packets,
>> in exchange for not having to sort out senders like slirp and not
>> having to be so careful about short-packet handling in NIC models.
>>
>> If MST is correct that some use cases require short-packet support,
>> then we need to go for option 1, I think.


For NIC RX, I wonder whether we can introduce a boolean to whether it 
requries padding. And then the netdevs can only do the padding when it's 
required. E.g virito-net doesn't need padding.

Thanks


> Regards,
> Bin
>


