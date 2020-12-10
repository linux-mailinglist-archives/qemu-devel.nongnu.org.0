Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AC52D5A13
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 13:14:43 +0100 (CET)
Received: from localhost ([::1]:39646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knKqI-0002hi-SK
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 07:14:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1knKXO-0008II-FT
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:55:11 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:44878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1knKXJ-0000kA-SQ
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 06:55:09 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1082813|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_regular_dialog|0.0229386-0.000646465-0.976415;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047203; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=4; RT=4; SR=0; TI=SMTPD_---.J5TnyRP_1607601286; 
Received: from 30.225.208.62(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.J5TnyRP_1607601286)
 by smtp.aliyun-inc.com(10.147.42.22); Thu, 10 Dec 2020 19:54:46 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
Subject: Re: [PATCH 2/4] target/arm: Fixup contiguous first-fault and no-fault
 loads
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201207044655.2312-1-zhiwei_liu@c-sky.com>
 <20201207044655.2312-3-zhiwei_liu@c-sky.com>
 <7c6ad308-a2ae-c90b-cac5-19c486b441b3@linaro.org>
Message-ID: <88fcf758-4723-3fb7-4a10-ebf23191e0b0@c-sky.com>
Date: Thu, 10 Dec 2020 19:54:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <7c6ad308-a2ae-c90b-cac5-19c486b441b3@linaro.org>
Content-Type: multipart/alternative;
 boundary="------------4A3754A2CD88D9CEF1414C3D"
Content-Language: en-US
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------4A3754A2CD88D9CEF1414C3D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2020/12/9 4:16, Richard Henderson wrote:
> On 12/6/20 10:46 PM, LIU Zhiwei wrote:
>> First-fault or no-fault doesn't mean only access one page.
> But the implementation is *allowed* to access only one page.
> Thus the comment:
>
>> -    /*
>> -     * MemSingleNF is allowed to fail for any reason.  We have special
>> -     * code above to handle the first element crossing a page boundary.
>> -     * As an implementation choice, decline to handle a cross-page element
>> -     * in any other position.
>> -     */
 From the pseudo code,  I see  that we should handle the first element 
in first-fault follow Mem. And the other elements in this function 
should follow  MemNF.

I have some questions here：

1. Why  do special process to the first element if it crosses pages in 
no-fault? Because it's not aligned?

// MemNF[] - non-assignment form

// =============================

(bits(8*size), boolean) MemNF[bits(64) address, integer size, AccType 
acctype]

    assert size IN {1, 2, 4, 8, 16};

    bits(8*size) value;

    aligned = (address == Align(address, size));

    A = SCTLR[].A;

    if !aligned && (A == '1') then

         return (bits(8*size) UNKNOWN, TRUE);

    atomic = aligned || size == 1;

    if !atomic then

         (value<7:0>, bad) = MemSingleNF[address, 1, acctype, aligned];

         if bad then

             return (bits(8*size) UNKNOWN, TRUE);

         // For subsequent bytes it is CONSTRAINED UNPREDICTABLE whether
    an unaligned Device memory

         // access will generate an Alignment Fault, as to get this far
    means the first byte did

         // not, so we must be changing to a new translation page.

         if !aligned then

         c = ConstrainUnpredictable(Unpredictable_DEVPAGE2);

         assert c IN {Constraint_FAULT, Constraint_NONE};

         if c == Constraint_NONE then aligned = TRUE;

         for i = 1 to size-1

             (value<8*i+7:8*i>, bad) = MemSingleNF[address+i, 1,
    acctype, aligned];

         if bad then

             return (bits(8*size) UNKNOWN, TRUE);

    else

         (value, bad) = MemSingleNF[address, size, acctype, aligned];

         if bad then

             return (bits(8*size) UNKNOWN, TRUE);

    return (value, FALSE);



2.  Why it doesn't access the second page like the first page? I think 
they should obey the same MemSingleNF implementation.

> r~


--------------4A3754A2CD88D9CEF1414C3D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <br>
    <br>
    <div class="moz-cite-prefix">On 2020/12/9 4:16, Richard Henderson
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:7c6ad308-a2ae-c90b-cac5-19c486b441b3@linaro.org">
      <pre class="moz-quote-pre" wrap="">On 12/6/20 10:46 PM, LIU Zhiwei wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">First-fault or no-fault doesn't mean only access one page.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">But the implementation is *allowed* to access only one page.
Thus the comment:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">-    /*
-     * MemSingleNF is allowed to fail for any reason.  We have special
-     * code above to handle the first element crossing a page boundary.
-     * As an implementation choice, decline to handle a cross-page element
-     * in any other position.
-     */
</pre>
      </blockquote>
    </blockquote>
    From the pseudo code,  I see  that we should handle the first
    element in first-fault follow Mem. And the other elements in this
    function should follow  MemNF.<br>
    <br>
    I have some questions here：<br>
    <br>
    1. Why  do special process to the first element if it crosses pages
    in no-fault? Because it's not aligned?<br>
    <br>
    <pre><font face="monospace">// MemNF[] - non-assignment form</font></pre>
    <pre><font face="monospace">// =============================</font></pre>
    <pre><font face="monospace">(bits(8*size), boolean) MemNF[bits(64) address, integer size, AccType acctype]</font></pre>
    <blockquote>
      <pre><font face="monospace">assert size IN {1, 2, 4, 8, 16};</font></pre>
      <pre><font face="monospace">bits(8*size) value;</font></pre>
      <pre><font face="monospace">aligned = (address == Align(address, size));</font></pre>
      <pre><font face="monospace">A = SCTLR[].A;</font></pre>
      <pre><font face="monospace">if !aligned &amp;&amp; (A == '1') then</font></pre>
      <pre><font face="monospace">    return (bits(8*size) UNKNOWN, TRUE);</font></pre>
      <pre><font face="monospace">atomic = aligned || size == 1;</font></pre>
      <pre><font face="monospace">if !atomic then</font></pre>
      <pre><font face="monospace">    (value&lt;7:0&gt;, bad) = MemSingleNF[address, 1, acctype, aligned];</font></pre>
      <pre><font face="monospace">    if bad then</font></pre>
      <pre><font face="monospace">        return (bits(8*size) UNKNOWN, TRUE);</font></pre>
      <pre><font face="monospace">    // For subsequent bytes it is CONSTRAINED UNPREDICTABLE whether an unaligned Device memory</font></pre>
      <pre><font face="monospace">    // access will generate an Alignment Fault, as to get this far means the first byte did</font></pre>
      <pre><font face="monospace">    // not, so we must be changing to a new translation page.</font></pre>
      <pre><font face="monospace">    if !aligned then</font></pre>
      <pre><font face="monospace">           c = ConstrainUnpredictable(Unpredictable_DEVPAGE2);</font></pre>
      <pre><font face="monospace">    assert c IN {Constraint_FAULT, Constraint_NONE};</font></pre>
      <pre><font face="monospace">    if c == Constraint_NONE then aligned = TRUE;</font></pre>
      <pre><font face="monospace">    for i = 1 to size-1</font></pre>
      <pre><font face="monospace">        (value&lt;8*i+7:8*i&gt;, bad) = MemSingleNF[address+i, 1, acctype, aligned];</font></pre>
      <pre><font face="monospace">    if bad then</font></pre>
      <pre><font face="monospace">        return (bits(8*size) UNKNOWN, TRUE);</font></pre>
      <pre><font face="monospace">else</font></pre>
      <pre><font face="monospace">    (value, bad) = MemSingleNF[address, size, acctype, aligned];</font></pre>
      <pre><font face="monospace">    if bad then</font></pre>
      <pre><font face="monospace">        return (bits(8*size) UNKNOWN, TRUE);</font></pre>
      <pre><font face="monospace">return (value, FALSE);</font></pre>
    </blockquote>
    <br>
    <br>
    2.  Why it doesn't access the second page like the first page? I
    think they should obey the same MemSingleNF implementation.<br>
    <br>
    <blockquote type="cite"
      cite="mid:7c6ad308-a2ae-c90b-cac5-19c486b441b3@linaro.org">
      <pre class="moz-quote-pre" wrap="">r~
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------4A3754A2CD88D9CEF1414C3D--

