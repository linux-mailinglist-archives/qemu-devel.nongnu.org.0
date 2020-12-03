Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A1C2CD370
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 11:28:23 +0100 (CET)
Received: from localhost ([::1]:35154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kklqY-0001T2-Nn
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 05:28:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1kklpF-0000UW-7I; Thu, 03 Dec 2020 05:27:01 -0500
Received: from mail.csgraf.de ([188.138.100.120]:45668
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1kklpC-0000Ro-Jp; Thu, 03 Dec 2020 05:27:00 -0500
Received: from Alexanders-Mac-mini.local
 (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com [3.122.114.9])
 by csgraf.de (Postfix) with UTF8SMTPSA id C5D9C3900107;
 Thu,  3 Dec 2020 11:26:55 +0100 (CET)
Subject: Re: [PATCH v1 1/1] hvf: arm: Properly sync guest time on migration
To: Frank Yang <lfy@google.com>
References: <CAEkmjvXGccGs2QhaiLFupTDWcnp4O+qez-uj8QdbRG13UfCy2Q@mail.gmail.com>
 <2dc974cc-abe2-d034-1720-d5a2651a9042@csgraf.de>
 <CAEkmjvV-XPmBCGsOnBhZ20t6D+vbp+7pOUpDeMJL3dKAjZvErQ@mail.gmail.com>
 <658b1719-4635-edab-f3e2-6a9ac0bc01a1@csgraf.de>
 <CAEkmjvVYhmWY683Y2Q+Ei-_r-1avjbuyScPSf7dWvJTUH+=sJg@mail.gmail.com>
From: Alexander Graf <agraf@csgraf.de>
Message-ID: <f4e71868-4674-469c-42ec-1017caffff1a@csgraf.de>
Date: Thu, 3 Dec 2020 11:26:55 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:84.0)
 Gecko/20100101 Thunderbird/84.0
MIME-Version: 1.0
In-Reply-To: <CAEkmjvVYhmWY683Y2Q+Ei-_r-1avjbuyScPSf7dWvJTUH+=sJg@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------B6A8962A668609DED67168AC"
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
--------------B6A8962A668609DED67168AC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 03.12.20 00:25, Frank Yang wrote:
>
>
> On Wed, Dec 2, 2020 at 2:57 PM Alexander Graf <agraf@csgraf.de 
> <mailto:agraf@csgraf.de>> wrote:
>
>
>     On 02.12.20 23:46, Frank Yang wrote:
>>
>>
>>     On Wed, Dec 2, 2020 at 2:28 PM Alexander Graf <agraf@csgraf.de
>>     <mailto:agraf@csgraf.de>> wrote:
>>
>>
>>         On 02.12.20 23:19, Frank Yang wrote:
>>>
>>>         From downstream:
>>>         https://android-review.googlesource.com/c/platform/external/qemu/+/1515002
>>>         <https://android-review.googlesource.com/c/platform/external/qemu/+/1515002>
>>>
>>>         Based on v3 of Alexander Graf's patches
>>>
>>>         https://patchew.org/QEMU/20201202190408.2041-1-agraf@csgraf.de
>>>         <https://patchew.org/QEMU/20201202190408.2041-1-agraf@csgraf.de>
>>>
>>>         We need to adjust CNTVOFF_EL2 so that time doesnt warp. 
>>>         Even though we
>>>         can set separate CNTVOFF_EL2 values per vCPU, it just is not
>>>         worth the
>>>         require effort to do that accurately---with individual
>>>         values, even if
>>>         they are a tiny bit off it can result in a lockup due to
>>>         inconsistent
>>>         time differences between vCPUs. So just use a global
>>>         approximate value
>>>         for now.
>>>
>>>         Not tested in upstream yet, but Android emulator snapshots
>>>         work without
>>>         time warp now.
>>>
>>>         Signed-off-by: Lingfeng Yang <lfy@google.com
>>>         <mailto:lfy@google.com>>
>>
>>
>>         If we just always make CNTV start at the same 0 as
>>         QEMU_CLOCK_VIRTUAL, we should be able to just recover the
>>         offset after migration by looking at QEMU_CLOCK_VIRTUAL to
>>         set CNTVOFF, right?
>>
>>         That would end up much easier than this patch I hope.
>>
>>
>>
>>     The virtual clock interfaces/implementations in QEMU seem complex
>>     to me relative to the fix needed here and they don't seem to
>>     compute ticks with mach_absolute_time() (which in this case we
>>     want since we want to compute in timer ticks instead of having to
>>     mess with ns / cycle conversions). I do agree this patch does
>>     seem more complicated on the surface though versus "just" setting
>>     cntvoff directly to some value. Maybe we should simplify the
>>     QEMU_CLOCK_VIRTUAL implementation first to maintain
>>     CNTVOFF_EL2/CNTV using mach_absolute_time() first?
>
>
>     So QEMU_CLOCK_VIRTUAL calls cpu_get_clock() which just adds an
>     offset to gettimeofday(). This offset is already part of the live
>     migration stream[1]. So if you just configure CNTVOFF_EL2 based on
>     QEMU_CLOCK_VIRTUAL adjusted by the clock frequency on vcpu init,
>     you should have everything you need. You can do that on every CPU
>     init even, as the virtual clock will just be 0 on start.
>
>     The only thing we need to change then is to move the WFI from a
>     direct call to mach_absolute_time() to also check the virtual
>     clock instead. I would hope that gettimeofday() calls
>     mach_absolute_time() in the background too to speed it up.
>
> Sounds plausible, but I noticed that we also have cpu_ticks_offset as 
> part of the migration stream, and I prefer mach_absolute_time() 
> (ticks) instead of seconds in WFI as well as it makes the calculation 
> more accurate (ticks against ticks instead of conversion between ns 
> and ticks).
>
> Should we look at integrating this with cpu_ticks_offset instead?


The big benefit of reusing the virtual clock is that you create 
compatible migration streams between TCG and HVF, no? You'd lose out on 
that with a hack like this.


Alex



--------------B6A8962A668609DED67168AC
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 03.12.20 00:25, Frank Yang wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAEkmjvVYhmWY683Y2Q+Ei-_r-1avjbuyScPSf7dWvJTUH+=sJg@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr"><br>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Wed, Dec 2, 2020 at 2:57
            PM Alexander Graf &lt;<a href="mailto:agraf@csgraf.de"
              moz-do-not-send="true">agraf@csgraf.de</a>&gt; wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <div>
              <p><br>
              </p>
              <div>On 02.12.20 23:46, Frank Yang wrote:<br>
              </div>
              <blockquote type="cite">
                <div dir="ltr">
                  <div dir="ltr"><br>
                  </div>
                  <br>
                  <div class="gmail_quote">
                    <div dir="ltr" class="gmail_attr">On Wed, Dec 2,
                      2020 at 2:28 PM Alexander Graf &lt;<a
                        href="mailto:agraf@csgraf.de" target="_blank"
                        moz-do-not-send="true">agraf@csgraf.de</a>&gt;
                      wrote:<br>
                    </div>
                    <blockquote class="gmail_quote" style="margin:0px
                      0px 0px 0.8ex;border-left:1px solid
                      rgb(204,204,204);padding-left:1ex">
                      <div>
                        <p><br>
                        </p>
                        <div>On 02.12.20 23:19, Frank Yang wrote:<br>
                        </div>
                        <blockquote type="cite">
                          <div dir="ltr"><br>
                            <div>From downstream: <a
href="https://android-review.googlesource.com/c/platform/external/qemu/+/1515002"
                                target="_blank" moz-do-not-send="true">https://android-review.googlesource.com/c/platform/external/qemu/+/1515002</a><br>
                              <br>
                              Based on v3 of Alexander Graf's patches<br>
                              <br>
                              <a
                                href="https://patchew.org/QEMU/20201202190408.2041-1-agraf@csgraf.de"
                                target="_blank" moz-do-not-send="true">https://patchew.org/QEMU/20201202190408.2041-1-agraf@csgraf.de</a><br>
                              <br>
                              We need to adjust CNTVOFF_EL2 so that time
                              doesnt warp.  Even though we<br>
                              can set separate CNTVOFF_EL2 values per
                              vCPU, it just is not worth the<br>
                              require effort to do that
                              accurately---with individual values, even
                              if<br>
                              they are a tiny bit off it can result in a
                              lockup due to inconsistent<br>
                              time differences between vCPUs. So just
                              use a global approximate value<br>
                              for now.<br>
                              <br>
                              Not tested in upstream yet, but Android
                              emulator snapshots work without<br>
                              time warp now.<br>
                              <br>
                              Signed-off-by: Lingfeng Yang &lt;<a
                                href="mailto:lfy@google.com"
                                target="_blank" moz-do-not-send="true">lfy@google.com</a>&gt;<br>
                            </div>
                          </div>
                        </blockquote>
                        <p><br>
                        </p>
                        <p>If we just always make CNTV start at the same
                          0 as QEMU_CLOCK_VIRTUAL, we should be able to
                          just recover the offset after migration by
                          looking at QEMU_CLOCK_VIRTUAL to set CNTVOFF,
                          right?<br>
                          <br>
                          That would end up much easier than this patch
                          I hope.<br>
                          <br>
                          <br>
                        </p>
                      </div>
                    </blockquote>
                    <div><br>
                    </div>
                    <div>The virtual clock interfaces/implementations in
                      QEMU seem complex to me relative to the fix needed
                      here and they don't seem to compute ticks with
                      mach_absolute_time() (which in this case we want
                      since we want to compute in timer ticks instead of
                      having to mess with ns / cycle conversions). I do
                      agree this patch does seem more complicated on the
                      surface though versus "just" setting
                      cntvoff directly to some value. Maybe we should
                      simplify the QEMU_CLOCK_VIRTUAL implementation
                      first to maintain CNTVOFF_EL2/CNTV using
                      mach_absolute_time() first?</div>
                  </div>
                </div>
              </blockquote>
              <p><br>
              </p>
              <p>So QEMU_CLOCK_VIRTUAL calls cpu_get_clock() which just
                adds an offset to gettimeofday(). This offset is already
                part of the live migration stream[1]. So if you just
                configure CNTVOFF_EL2 based on QEMU_CLOCK_VIRTUAL
                adjusted by the clock frequency on vcpu init, you should
                have everything you need. You can do that on every CPU
                init even, as the virtual clock will just be 0 on start.<br>
                <br>
                The only thing we need to change then is to move the WFI
                from a direct call to mach_absolute_time() to also check
                the virtual clock instead. I would hope that
                gettimeofday() calls mach_absolute_time() in the
                background too to speed it up.<br>
                <br>
              </p>
            </div>
          </blockquote>
          <div>Sounds plausible, but I noticed that we also have
            cpu_ticks_offset as part of the migration stream, and I
            prefer mach_absolute_time() (ticks) instead of seconds in
            WFI as well as it makes the calculation more accurate (ticks
            against ticks instead of conversion between ns and ticks).</div>
          <div><br>
          </div>
          <div>Should we look at integrating this with cpu_ticks_offset
            instead?</div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>The big benefit of reusing the virtual clock is that you create
      compatible migration streams between TCG and HVF, no? You'd lose
      out on that with a hack like this.<br>
      <br>
      <br>
      Alex</p>
    <p><br>
    </p>
  </body>
</html>

--------------B6A8962A668609DED67168AC--

