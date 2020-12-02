Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD412CC99A
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 23:29:38 +0100 (CET)
Received: from localhost ([::1]:37528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkacz-0003P3-0J
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 17:29:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1kkac0-0002rc-0r; Wed, 02 Dec 2020 17:28:36 -0500
Received: from mail.csgraf.de ([188.138.100.120]:38390
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1kkabv-0006IK-1D; Wed, 02 Dec 2020 17:28:35 -0500
Received: from freeip.amazon.com
 (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com [3.122.114.9])
 by csgraf.de (Postfix) with ESMTPSA id 9C0A73900313;
 Wed,  2 Dec 2020 23:28:27 +0100 (CET)
Subject: Re: [PATCH v1 1/1] hvf: arm: Properly sync guest time on migration
To: Frank Yang <lfy@google.com>
References: <CAEkmjvXGccGs2QhaiLFupTDWcnp4O+qez-uj8QdbRG13UfCy2Q@mail.gmail.com>
From: Alexander Graf <agraf@csgraf.de>
Message-ID: <2dc974cc-abe2-d034-1720-d5a2651a9042@csgraf.de>
Date: Wed, 2 Dec 2020 23:28:27 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAEkmjvXGccGs2QhaiLFupTDWcnp4O+qez-uj8QdbRG13UfCy2Q@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------B7153BB47DEFF0058044D14E"
Content-Language: en-US
Received-SPF: pass client-ip=188.138.100.120; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Collingbourne <pcc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------B7153BB47DEFF0058044D14E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit


On 02.12.20 23:19, Frank Yang wrote:
>
> From downstream: 
> https://android-review.googlesource.com/c/platform/external/qemu/+/1515002 
> <https://android-review.googlesource.com/c/platform/external/qemu/+/1515002>
>
> Based on v3 of Alexander Graf's patches
>
> https://patchew.org/QEMU/20201202190408.2041-1-agraf@csgraf.de 
> <https://patchew.org/QEMU/20201202190408.2041-1-agraf@csgraf.de>
>
> We need to adjust CNTVOFF_EL2 so that time doesnt warp.  Even though we
> can set separate CNTVOFF_EL2 values per vCPU, it just is not worth the
> require effort to do that accurately---with individual values, even if
> they are a tiny bit off it can result in a lockup due to inconsistent
> time differences between vCPUs. So just use a global approximate value
> for now.
>
> Not tested in upstream yet, but Android emulator snapshots work without
> time warp now.
>
> Signed-off-by: Lingfeng Yang <lfy@google.com <mailto:lfy@google.com>>


If we just always make CNTV start at the same 0 as QEMU_CLOCK_VIRTUAL, 
we should be able to just recover the offset after migration by looking 
at QEMU_CLOCK_VIRTUAL to set CNTVOFF, right?

That would end up much easier than this patch I hope.


Alex



--------------B7153BB47DEFF0058044D14E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 02.12.20 23:19, Frank Yang wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAEkmjvXGccGs2QhaiLFupTDWcnp4O+qez-uj8QdbRG13UfCy2Q@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr"><br>
        <div>From downstream: <a
href="https://android-review.googlesource.com/c/platform/external/qemu/+/1515002"
            moz-do-not-send="true">https://android-review.googlesource.com/c/platform/external/qemu/+/1515002</a><br>
          <br>
          Based on v3 of Alexander Graf's patches<br>
          <br>
          <a
            href="https://patchew.org/QEMU/20201202190408.2041-1-agraf@csgraf.de"
            moz-do-not-send="true">https://patchew.org/QEMU/20201202190408.2041-1-agraf@csgraf.de</a><br>
          <br>
          We need to adjust CNTVOFF_EL2 so that time doesnt warp.  Even
          though we<br>
          can set separate CNTVOFF_EL2 values per vCPU, it just is not
          worth the<br>
          require effort to do that accurately---with individual values,
          even if<br>
          they are a tiny bit off it can result in a lockup due to
          inconsistent<br>
          time differences between vCPUs. So just use a global
          approximate value<br>
          for now.<br>
          <br>
          Not tested in upstream yet, but Android emulator snapshots
          work without<br>
          time warp now.<br>
          <br>
          Signed-off-by: Lingfeng Yang &lt;<a
            href="mailto:lfy@google.com" moz-do-not-send="true">lfy@google.com</a>&gt;<br>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>If we just always make CNTV start at the same 0 as
      QEMU_CLOCK_VIRTUAL, we should be able to just recover the offset
      after migration by looking at QEMU_CLOCK_VIRTUAL to set CNTVOFF,
      right?<br>
      <br>
      That would end up much easier than this patch I hope.<br>
      <br>
      <br>
      Alex<br>
    </p>
    <p><br>
    </p>
  </body>
</html>

--------------B7153BB47DEFF0058044D14E--

