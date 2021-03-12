Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAD93385DE
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 07:28:07 +0100 (CET)
Received: from localhost ([::1]:52198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKbHK-0007PW-Ld
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 01:28:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lKbEu-0005CI-Fz
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 01:25:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lKbEs-0002mp-Cn
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 01:25:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615530333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hKRaUzPzRYm/SwsPE3y3nQa2CTypP78OfvyhRmSoUWA=;
 b=Mo03kXgJVEGapcJ7383EaaT2sZAbgrK61KGas1l/4hSXmd3ZFzFfw886sWm1C87l+992Yr
 jQsekldGEYcRq+JD1eLOAz5nhaHnn9LJRBxRBqntFwVMmfMUA10kc+kZiFBsuRqVEYJmhx
 1XUGA3bexsMamNAkLjDwYzgtAgdW77M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-224-HDjEPP1xMDGKpvBp6EnSXw-1; Fri, 12 Mar 2021 01:25:29 -0500
X-MC-Unique: HDjEPP1xMDGKpvBp6EnSXw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C388107ACCA;
 Fri, 12 Mar 2021 06:25:28 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-33.pek2.redhat.com
 [10.72.13.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 676DE5C234;
 Fri, 12 Mar 2021 06:25:24 +0000 (UTC)
Subject: Re: [RFC PATCH v3 02/10] net: Pad short frames to minimum size before
 send from SLiRP/TAP
To: Yan Vugenfirer <yvugenfi@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
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
 <9FFFC757-FD77-4683-8A7F-A39E2337EE2F@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <4e56d888-5a52-2563-bea9-26f77182a494@redhat.com>
Date: Fri, 12 Mar 2021 14:25:22 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <9FFFC757-FD77-4683-8A7F-A39E2337EE2F@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative;
 boundary="------------BA25CFC3FD4E9F17688DC6C1"
Content-Language: en-GB
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------BA25CFC3FD4E9F17688DC6C1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 2021/3/9 8:30 下午, Yan Vugenfirer wrote:
>
>
>> On 9 Mar 2021, at 12:13 PM, Peter Maydell <peter.maydell@linaro.org 
>> <mailto:peter.maydell@linaro.org>> wrote:
>>
>> On Tue, 9 Mar 2021 at 09:01, Bin Meng <bmeng.cn@gmail.com 
>> <mailto:bmeng.cn@gmail.com>> wrote:
>>>
>>> Hi Jason,
>>>
>>> On Tue, Mar 9, 2021 at 5:00 PM Bin Meng <bmeng.cn@gmail.com 
>>> <mailto:bmeng.cn@gmail.com>> wrote:
>>>>
>>>> Hi Jason,
>>>>
>>>> On Tue, Mar 9, 2021 at 4:57 PM Jason Wang <jasowang@redhat.com 
>>>> <mailto:jasowang@redhat.com>> wrote:
>>>>>
>>>>>
>>>>> On 2021/3/9 4:35 下午, Bin Meng wrote:
>>>>>> Hi Jason,
>>>>>>
>>>>>> On Tue, Mar 9, 2021 at 4:23 PM Jason Wang <jasowang@redhat.com 
>>>>>> <mailto:jasowang@redhat.com>> wrote:
>>>>>>>
>>>>>>> On 2021/3/8 6:22 下午, Peter Maydell wrote:
>>>>>>>> I think the key thing we need to do here is make a decision
>>>>>>>> and be clear about what we're doing. There are three options
>>>>>>>> I can see:
>>>>>>>>
>>>>>>>> (1) we say that the net API demands that backends pad
>>>>>>>> packets they emit to the minimum ethernet frame length
>>>>>>>> unless they specifically are intending to emit a short frame,
>>>>>>>> and we fix any backends that don't comply (or equivalently,
>>>>>>>> add support in the core code for a backend to mark itself
>>>>>>>> as "I don't pad; please do it for me").
>>>>>>>>
>>>>>>>> (2) we say that the networking subsystem doesn't support
>>>>>>>> short packets, and just have the common code always enforce
>>>>>>>> padding short frames to the minimum length somewhere between
>>>>>>>> when it receives a packet from a backend and passes it to
>>>>>>>> a NIC model.
>>>>>>>>
>>>>>>>> (3) we say that it's the job of the NIC models to pad
>>>>>>>> short frames as they see them coming in.
>>
>>>>>>> I'm not sure how much value we can gain from (1). So (2) looks 
>>>>>>> better to me.
>>>>>>>
>>>>>>> Bin or Philippe, want to send a new version?
>>>>>>>
>>>>>> I think this series does what (2) asks for. Or am I missing anything?
>>>>>
>>>>>
>>>>> It only did the padding for user/TAP.
>>>>
>>>
>>> (hit send too soon ...)
>>>
>>> Ah, so we want this:
>>>
>>> if (sender->info->type != NET_CLIENT_DRIVER_NIC)
>>>
>>> correct?
>>
>> No, option (2) is "always pad short packets regardless of
>> sender->info->type". Even if a NIC driver sends out a short
>> packet, we want to pad it, because we might be feeding it to
>> something that assumes it does not see short packets.
>
> Some thought on this option - in such case with virtio-net, can we 
> also get an indication from the device that the packet will be padded?
> Currently we are padding short packets in Windows driver (this is MS 
> certification requirement), and it will be nice not do to this in the 
> guest if device will announce such capability.


Just to make sure I understand the requirement.

Is it a way to control padding from the driver or soemthing in the vnet 
header that tells the driver that a packet has been padded?

Thanks


>
> Best regards,
> Yan.
>
>>
>> thanks
>> -- PMM
>

--------------BA25CFC3FD4E9F17688DC6C1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021/3/9 8:30 下午, Yan Vugenfirer
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:9FFFC757-FD77-4683-8A7F-A39E2337EE2F@redhat.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <br class="">
      <div><br class="">
        <blockquote type="cite" class="">
          <div class="">On 9 Mar 2021, at 12:13 PM, Peter Maydell &lt;<a
              href="mailto:peter.maydell@linaro.org" class=""
              moz-do-not-send="true">peter.maydell@linaro.org</a>&gt;
            wrote:</div>
          <br class="Apple-interchange-newline">
          <div class="">
            <meta charset="UTF-8" class="">
            <span style="caret-color: rgb(0, 0, 0); font-family:
              Helvetica; font-size: 14px; font-style: normal;
              font-variant-caps: normal; font-weight: normal;
              letter-spacing: normal; text-align: start; text-indent:
              0px; text-transform: none; white-space: normal;
              word-spacing: 0px; -webkit-text-stroke-width: 0px;
              text-decoration: none; float: none; display: inline
              !important;" class="">On Tue, 9 Mar 2021 at 09:01, Bin
              Meng &lt;</span><a href="mailto:bmeng.cn@gmail.com"
              style="font-family: Helvetica; font-size: 14px;
              font-style: normal; font-variant-caps: normal;
              font-weight: normal; letter-spacing: normal; orphans:
              auto; text-align: start; text-indent: 0px; text-transform:
              none; white-space: normal; widows: auto; word-spacing:
              0px; -webkit-text-size-adjust: auto;
              -webkit-text-stroke-width: 0px;" class=""
              moz-do-not-send="true">bmeng.cn@gmail.com</a><span
              style="caret-color: rgb(0, 0, 0); font-family: Helvetica;
              font-size: 14px; font-style: normal; font-variant-caps:
              normal; font-weight: normal; letter-spacing: normal;
              text-align: start; text-indent: 0px; text-transform: none;
              white-space: normal; word-spacing: 0px;
              -webkit-text-stroke-width: 0px; text-decoration: none;
              float: none; display: inline !important;" class="">&gt;
              wrote:</span><br style="caret-color: rgb(0, 0, 0);
              font-family: Helvetica; font-size: 14px; font-style:
              normal; font-variant-caps: normal; font-weight: normal;
              letter-spacing: normal; text-align: start; text-indent:
              0px; text-transform: none; white-space: normal;
              word-spacing: 0px; -webkit-text-stroke-width: 0px;
              text-decoration: none;" class="">
            <blockquote type="cite" style="font-family: Helvetica;
              font-size: 14px; font-style: normal; font-variant-caps:
              normal; font-weight: normal; letter-spacing: normal;
              orphans: auto; text-align: start; text-indent: 0px;
              text-transform: none; white-space: normal; widows: auto;
              word-spacing: 0px; -webkit-text-size-adjust: auto;
              -webkit-text-stroke-width: 0px; text-decoration: none;"
              class=""><br class="">
              Hi Jason,<br class="">
              <br class="">
              On Tue, Mar 9, 2021 at 5:00 PM Bin Meng &lt;<a
                href="mailto:bmeng.cn@gmail.com" class=""
                moz-do-not-send="true">bmeng.cn@gmail.com</a>&gt; wrote:<br
                class="">
              <blockquote type="cite" class=""><br class="">
                Hi Jason,<br class="">
                <br class="">
                On Tue, Mar 9, 2021 at 4:57 PM Jason Wang &lt;<a
                  href="mailto:jasowang@redhat.com" class=""
                  moz-do-not-send="true">jasowang@redhat.com</a>&gt;
                wrote:<br class="">
                <blockquote type="cite" class=""><br class="">
                  <br class="">
                  On 2021/3/9 4:35 下午, Bin Meng wrote:<br class="">
                  <blockquote type="cite" class="">Hi Jason,<br class="">
                    <br class="">
                    On Tue, Mar 9, 2021 at 4:23 PM Jason Wang &lt;<a
                      href="mailto:jasowang@redhat.com" class=""
                      moz-do-not-send="true">jasowang@redhat.com</a>&gt;
                    wrote:<br class="">
                    <blockquote type="cite" class=""><br class="">
                      On 2021/3/8 6:22 下午, Peter Maydell wrote:<br
                        class="">
                      <blockquote type="cite" class="">I think the key
                        thing we need to do here is make a decision<br
                          class="">
                        and be clear about what we're doing. There are
                        three options<br class="">
                        I can see:<br class="">
                        <br class="">
                        (1) we say that the net API demands that
                        backends pad<br class="">
                        packets they emit to the minimum ethernet frame
                        length<br class="">
                        unless they specifically are intending to emit a
                        short frame,<br class="">
                        and we fix any backends that don't comply (or
                        equivalently,<br class="">
                        add support in the core code for a backend to
                        mark itself<br class="">
                        as "I don't pad; please do it for me").<br
                          class="">
                        <br class="">
                        (2) we say that the networking subsystem doesn't
                        support<br class="">
                        short packets, and just have the common code
                        always enforce<br class="">
                        padding short frames to the minimum length
                        somewhere between<br class="">
                        when it receives a packet from a backend and
                        passes it to<br class="">
                        a NIC model.<br class="">
                        <br class="">
                        (3) we say that it's the job of the NIC models
                        to pad<br class="">
                        short frames as they see them coming in.<br
                          class="">
                      </blockquote>
                    </blockquote>
                  </blockquote>
                </blockquote>
              </blockquote>
            </blockquote>
            <br style="caret-color: rgb(0, 0, 0); font-family:
              Helvetica; font-size: 14px; font-style: normal;
              font-variant-caps: normal; font-weight: normal;
              letter-spacing: normal; text-align: start; text-indent:
              0px; text-transform: none; white-space: normal;
              word-spacing: 0px; -webkit-text-stroke-width: 0px;
              text-decoration: none;" class="">
            <blockquote type="cite" style="font-family: Helvetica;
              font-size: 14px; font-style: normal; font-variant-caps:
              normal; font-weight: normal; letter-spacing: normal;
              orphans: auto; text-align: start; text-indent: 0px;
              text-transform: none; white-space: normal; widows: auto;
              word-spacing: 0px; -webkit-text-size-adjust: auto;
              -webkit-text-stroke-width: 0px; text-decoration: none;"
              class="">
              <blockquote type="cite" class="">
                <blockquote type="cite" class="">
                  <blockquote type="cite" class="">
                    <blockquote type="cite" class="">I'm not sure how
                      much value we can gain from (1). So (2) looks
                      better to me.<br class="">
                      <br class="">
                      Bin or Philippe, want to send a new version?<br
                        class="">
                      <br class="">
                    </blockquote>
                    I think this series does what (2) asks for. Or am I
                    missing anything?<br class="">
                  </blockquote>
                  <br class="">
                  <br class="">
                  It only did the padding for user/TAP.<br class="">
                </blockquote>
                <br class="">
              </blockquote>
              <br class="">
              (hit send too soon ...)<br class="">
              <br class="">
              Ah, so we want this:<br class="">
              <br class="">
              if (sender-&gt;info-&gt;type != NET_CLIENT_DRIVER_NIC)<br
                class="">
              <br class="">
              correct?<br class="">
            </blockquote>
            <br style="caret-color: rgb(0, 0, 0); font-family:
              Helvetica; font-size: 14px; font-style: normal;
              font-variant-caps: normal; font-weight: normal;
              letter-spacing: normal; text-align: start; text-indent:
              0px; text-transform: none; white-space: normal;
              word-spacing: 0px; -webkit-text-stroke-width: 0px;
              text-decoration: none;" class="">
            <span style="caret-color: rgb(0, 0, 0); font-family:
              Helvetica; font-size: 14px; font-style: normal;
              font-variant-caps: normal; font-weight: normal;
              letter-spacing: normal; text-align: start; text-indent:
              0px; text-transform: none; white-space: normal;
              word-spacing: 0px; -webkit-text-stroke-width: 0px;
              text-decoration: none; float: none; display: inline
              !important;" class="">No, option (2) is "always pad short
              packets regardless of</span><br style="caret-color: rgb(0,
              0, 0); font-family: Helvetica; font-size: 14px;
              font-style: normal; font-variant-caps: normal;
              font-weight: normal; letter-spacing: normal; text-align:
              start; text-indent: 0px; text-transform: none;
              white-space: normal; word-spacing: 0px;
              -webkit-text-stroke-width: 0px; text-decoration: none;"
              class="">
            <span style="caret-color: rgb(0, 0, 0); font-family:
              Helvetica; font-size: 14px; font-style: normal;
              font-variant-caps: normal; font-weight: normal;
              letter-spacing: normal; text-align: start; text-indent:
              0px; text-transform: none; white-space: normal;
              word-spacing: 0px; -webkit-text-stroke-width: 0px;
              text-decoration: none; float: none; display: inline
              !important;" class="">sender-&gt;info-&gt;type". Even if a
              NIC driver sends out a short</span><br style="caret-color:
              rgb(0, 0, 0); font-family: Helvetica; font-size: 14px;
              font-style: normal; font-variant-caps: normal;
              font-weight: normal; letter-spacing: normal; text-align:
              start; text-indent: 0px; text-transform: none;
              white-space: normal; word-spacing: 0px;
              -webkit-text-stroke-width: 0px; text-decoration: none;"
              class="">
            <span style="caret-color: rgb(0, 0, 0); font-family:
              Helvetica; font-size: 14px; font-style: normal;
              font-variant-caps: normal; font-weight: normal;
              letter-spacing: normal; text-align: start; text-indent:
              0px; text-transform: none; white-space: normal;
              word-spacing: 0px; -webkit-text-stroke-width: 0px;
              text-decoration: none; float: none; display: inline
              !important;" class="">packet, we want to pad it, because
              we might be feeding it to</span><br style="caret-color:
              rgb(0, 0, 0); font-family: Helvetica; font-size: 14px;
              font-style: normal; font-variant-caps: normal;
              font-weight: normal; letter-spacing: normal; text-align:
              start; text-indent: 0px; text-transform: none;
              white-space: normal; word-spacing: 0px;
              -webkit-text-stroke-width: 0px; text-decoration: none;"
              class="">
            <span style="caret-color: rgb(0, 0, 0); font-family:
              Helvetica; font-size: 14px; font-style: normal;
              font-variant-caps: normal; font-weight: normal;
              letter-spacing: normal; text-align: start; text-indent:
              0px; text-transform: none; white-space: normal;
              word-spacing: 0px; -webkit-text-stroke-width: 0px;
              text-decoration: none; float: none; display: inline
              !important;" class="">something that assumes it does not
              see short packets.</span><br style="caret-color: rgb(0, 0,
              0); font-family: Helvetica; font-size: 14px; font-style:
              normal; font-variant-caps: normal; font-weight: normal;
              letter-spacing: normal; text-align: start; text-indent:
              0px; text-transform: none; white-space: normal;
              word-spacing: 0px; -webkit-text-stroke-width: 0px;
              text-decoration: none;" class="">
          </div>
        </blockquote>
        <div><br class="">
        </div>
        Some thought on this option - in such case with virtio-net, can
        we also get an indication from the device that the packet will
        be padded?</div>
      <div>Currently we are padding short packets in Windows driver
        (this is MS certification requirement), and it will be nice not
        do to this in the guest if device will announce such capability.</div>
    </blockquote>
    <p><br>
    </p>
    <p>Just to make sure I understand the requirement.</p>
    <p>Is it a way to control padding from the driver or soemthing in
      the vnet header that tells the driver that a packet has been
      padded?</p>
    <p>Thanks<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:9FFFC757-FD77-4683-8A7F-A39E2337EE2F@redhat.com">
      <div><br class="">
      </div>
      <div>Best regards,</div>
      <div>Yan.</div>
      <div><br class="">
        <blockquote type="cite" class="">
          <div class=""><br style="caret-color: rgb(0, 0, 0);
              font-family: Helvetica; font-size: 14px; font-style:
              normal; font-variant-caps: normal; font-weight: normal;
              letter-spacing: normal; text-align: start; text-indent:
              0px; text-transform: none; white-space: normal;
              word-spacing: 0px; -webkit-text-stroke-width: 0px;
              text-decoration: none;" class="">
            <span style="caret-color: rgb(0, 0, 0); font-family:
              Helvetica; font-size: 14px; font-style: normal;
              font-variant-caps: normal; font-weight: normal;
              letter-spacing: normal; text-align: start; text-indent:
              0px; text-transform: none; white-space: normal;
              word-spacing: 0px; -webkit-text-stroke-width: 0px;
              text-decoration: none; float: none; display: inline
              !important;" class="">thanks</span><br style="caret-color:
              rgb(0, 0, 0); font-family: Helvetica; font-size: 14px;
              font-style: normal; font-variant-caps: normal;
              font-weight: normal; letter-spacing: normal; text-align:
              start; text-indent: 0px; text-transform: none;
              white-space: normal; word-spacing: 0px;
              -webkit-text-stroke-width: 0px; text-decoration: none;"
              class="">
            <span style="caret-color: rgb(0, 0, 0); font-family:
              Helvetica; font-size: 14px; font-style: normal;
              font-variant-caps: normal; font-weight: normal;
              letter-spacing: normal; text-align: start; text-indent:
              0px; text-transform: none; white-space: normal;
              word-spacing: 0px; -webkit-text-stroke-width: 0px;
              text-decoration: none; float: none; display: inline
              !important;" class="">-- PMM</span></div>
        </blockquote>
      </div>
      <br class="">
    </blockquote>
  </body>
</html>

--------------BA25CFC3FD4E9F17688DC6C1--


