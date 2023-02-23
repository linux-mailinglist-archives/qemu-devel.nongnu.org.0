Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B69DB6A0E4E
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 18:05:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVF0O-0003MZ-2L; Thu, 23 Feb 2023 12:03:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pVEzI-0003I9-59
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 12:02:33 -0500
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pVEzF-0000r7-Rn
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 12:02:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
 Cc:To:Subject:Reply-To:MIME-Version:Date:Message-ID:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ubj7i6ae8BxEyyN8QvOgqMtuciLl/gXUzyYY2nMhU3s=; b=NPB/nmYv54gAqq0GpgDWcRIRE7
 uofALpEGCknX0/SSrlyDgUXr6utL6IqL5fAPgRcvcuUTR/QgNO7UN3K66isjh7cLgbGWcVp5dYZ8m
 Cp4d3YmFGk/MzWr9LHt/zpMJkymH3nlHphAGkTpIQUuZY39chMToAlBGdn80edmqFh40=;
Message-ID: <77ff101f-30a1-10bd-c732-31dbbfa91463@rev.ng>
Date: Thu, 23 Feb 2023 18:02:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v5 05/14] Hexagon (target/hexagon) Analyze packet before
 generating TCG
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, philmd@linaro.org, ale@rev.ng,
 bcain@quicinc.com, quic_mathbern@quicinc.com
References: <20230131225647.25274-1-tsimpson@quicinc.com>
 <20230131225647.25274-6-tsimpson@quicinc.com>
Content-Language: en-US
Organization: rev.ng
In-Reply-To: <20230131225647.25274-6-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  anjo@rev.ng
X-ACL-Warn: ,  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 1/31/23 23:56, Taylor Simpson wrote:
> diff --git a/target/hexagon/gen_analyze_funcs.py b/target/hexagon/gen_analyze_funcs.py
> new file mode 100755
> index 0000000000..c45696bec8
> --- /dev/null
> +++ b/target/hexagon/gen_analyze_funcs.py
> @@ -0,0 +1,237 @@
> +#!/usr/bin/env python3
> +
> +##
> +##  Copyright(c) 2022-2023 Qualcomm Innovation Center, Inc. All Rights Reserved.
> +##
> +##  This program is free software; you can redistribute it and/or modify
> +##  it under the terms of the GNU General Public License as published by
> +##  the Free Software Foundation; either version 2 of the License, or
> +##  (at your option) any later version.
> +##
> +##  This program is distributed in the hope that it will be useful,
> +##  but WITHOUT ANY WARRANTY; without even the implied warranty of
> +##  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +##  GNU General Public License for more details.
> +##
> +##  You should have received a copy of the GNU General Public License
> +##  along with this program; if not, see <http://www.gnu.org/licenses/>.
> +##
> +
> +import sys
> +import re
> +import string
> +import hex_common
> +
> +##
> +## Helpers for gen_analyze_func
> +##
> +def is_predicated(tag):
> +    return 'A_CONDEXEC' in hex_common.attribdict[tag]
> +
> +def analyze_opn_old(f, tag, regtype, regid, regno):
> +    regN = "%s%sN" % (regtype, regid)
> +    predicated = "true" if is_predicated(tag) else "false"
> +    if (regtype == "R"):
> +        if (regid in {"ss", "tt"}):
> +            f.write("//    const int %s = insn->regno[%d];\n" % \
> +                (regN, regno))
> +        elif (regid in {"dd", "ee", "xx", "yy"}):
> +            f.write("    const int %s = insn->regno[%d];\n" % (regN, regno))
> +            f.write("    ctx_log_reg_write_pair(ctx, %s, %s);\n" % \
> +                (regN, predicated))
> +        elif (regid in {"s", "t", "u", "v"}):
> +            f.write("//    const int %s = insn->regno[%d];\n" % \
> +                (regN, regno))
> +        elif (regid in {"d", "e", "x", "y"}):
> +            f.write("    const int %s = insn->regno[%d];\n" % (regN, regno))
> +            f.write("    ctx_log_reg_write(ctx, %s, %s);\n" % \
> +                (regN, predicated))
> +        else:
> +            print("Bad register parse: ", regtype, regid)
> +    elif (regtype == "P"):
> +        if (regid in {"s", "t", "u", "v"}):
> +            f.write("//    const int %s = insn->regno[%d];\n" % \
> +                (regN, regno))
> +        elif (regid in {"d", "e", "x"}):
> +            f.write("    const int %s = insn->regno[%d];\n" % (regN, regno))
> +            f.write("    ctx_log_pred_write(ctx, %s);\n" % (regN))
> +        else:
> +            print("Bad register parse: ", regtype, regid)
> +    elif (regtype == "C"):
> +        if (regid == "ss"):
> +            f.write("//    const int %s = insn->regno[%d] + HEX_REG_SA0;\n" % \
> +                (regN, regno))
> +        elif (regid == "dd"):
> +            f.write("    const int %s = insn->regno[%d] + HEX_REG_SA0;\n" % \
> +                (regN, regno))
> +            f.write("    ctx_log_reg_write_pair(ctx, %s, %s);\n" % \
> +                (regN, predicated))
> +        elif (regid == "s"):
> +            f.write("//    const int %s = insn->regno[%d] + HEX_REG_SA0;\n" % \
> +                (regN, regno))
> +        elif (regid == "d"):
> +            f.write("    const int %s = insn->regno[%d] + HEX_REG_SA0;\n" % \
> +                (regN, regno))
> +            f.write("    ctx_log_reg_write(ctx, %s, %s);\n" % \
> +                (regN, predicated))
> +        else:
> +            print("Bad register parse: ", regtype, regid)
> +    elif (regtype == "M"):
> +        if (regid == "u"):
> +            f.write("//    const int %s = insn->regno[%d];\n"% \
> +                (regN, regno))
> +        else:
> +            print("Bad register parse: ", regtype, regid)
> +    elif (regtype == "V"):
> +        if (regid in {"dd", "xx"}):
> +            f.write("//    const int %s = insn->regno[%d];\n" %\
> +                (regN, regno))
> +        elif (regid in {"uu", "vv"}):
> +            f.write("//    const int %s = insn->regno[%d];\n" % \
> +                (regN, regno))
> +        elif (regid in {"s", "u", "v", "w"}):
> +            f.write("//    const int %s = insn->regno[%d];\n" % \
> +                (regN, regno))
> +        elif (regid in {"d", "x", "y"}):
> +            f.write("//    const int %s = insn->regno[%d];\n" % \
> +                (regN, regno))
> +        else:
> +            print("Bad register parse: ", regtype, regid)
> +    elif (regtype == "Q"):
> +        if (regid in {"d", "e", "x"}):
> +            f.write("//    const int %s = insn->regno[%d];\n" % \
> +                (regN, regno))
> +        elif (regid in {"s", "t", "u", "v"}):
> +            f.write("//    const int %s = insn->regno[%d];\n" % \
> +                (regN, regno))
> +        else:
> +            print("Bad register parse: ", regtype, regid)
> +    elif (regtype == "G"):
> +        if (regid in {"dd"}):
> +            f.write("//    const int %s = insn->regno[%d];\n" % \
> +                (regN, regno))
> +        elif (regid in {"d"}):
> +            f.write("//    const int %s = insn->regno[%d];\n" % \
> +                (regN, regno))
> +        elif (regid in {"ss"}):
> +            f.write("//    const int %s = insn->regno[%d];\n" % \
> +                (regN, regno))
> +        elif (regid in {"s"}):
> +            f.write("//    const int %s = insn->regno[%d];\n" % \
> +                (regN, regno))
> +        else:
> +            print("Bad register parse: ", regtype, regid)
> +    elif (regtype == "S"):
> +        if (regid in {"dd"}):
> +            f.write("//    const int %s = insn->regno[%d];\n" % \
> +                (regN, regno))
> +        elif (regid in {"d"}):
> +            f.write("//    const int %s = insn->regno[%d];\n" % \
> +                (regN, regno))
> +        elif (regid in {"ss"}):
> +            f.write("//    const int %s = insn->regno[%d];\n" % \
> +                (regN, regno))
> +        elif (regid in {"s"}):
> +            f.write("//    const int %s = insn->regno[%d];\n" % \
> +                (regN, regno))
> +        else:
> +            print("Bad register parse: ", regtype, regid)
> +    else:
> +        print("Bad register parse: ", regtype, regid)
> +
> +def analyze_opn_new(f, tag, regtype, regid, regno):
> +    regN = "%s%sN" % (regtype, regid)
> +    if (regtype == "N"):
> +        if (regid in {"s", "t"}):
> +            f.write("//    const int %s = insn->regno[%d];\n" % \
> +                (regN, regno))
> +        else:
> +            print("Bad register parse: ", regtype, regid)
> +    elif (regtype == "P"):
> +        if (regid in {"t", "u", "v"}):
> +            f.write("//    const int %s = insn->regno[%d];\n" % \
> +                (regN, regno))
> +        else:
> +            print("Bad register parse: ", regtype, regid)
> +    elif (regtype == "O"):
> +        if (regid == "s"):
> +            f.write("//    const int %s = insn->regno[%d];\n" % \
> +                (regN, regno))
> +        else:
> +            print("Bad register parse: ", regtype, regid)
> +    else:
> +        print("Bad register parse: ", regtype, regid)

For analyze_opn_new and analyze_opn_old consider condensing the if/else 
statements
since most branches are very similar. I find something like the 
following more readable

     def analyze_opn_old(f, tag, regtype, regid, regno):
         regN = "%s%sN" % (regtype, regid)
         predicated = "true" if is_predicated(tag) else "false"
         pair = "_pair" if hex_common.is_pair(regid) else ""
         if (regtype == "R" and regid in {"dd", "ee", "xx", "yy", "d", 
"e", "x", "y"}):
             f.write("    const int %s = insn->regno[%d];\n" % (regN, 
regno))
             f.write("    ctx_log_reg_write%s(ctx, %s, %s);\n" % (pair, 
regN, predicated))
         elif (regtype == "P" and regid in {"d", "e", "x"}):
             f.write("    const int %s = insn->regno[%d];\n" % (regN, 
regno))
             f.write("    ctx_log_pred_write(ctx, %s);\n" % (regN))
         elif (regtype == "C" and regid in {"d", "dd"}):
             f.write("    const int %s = insn->regno[%d] + 
HEX_REG_SA0;\n" % (regN, regno))
             f.write("    ctx_log_reg_write%s(ctx, %s, %s);\n" % (pair, 
regN, predicated))
         elif (regtype == "V" and regid in {"d", "x", "y", "dd", "xx"}):
             newv = "EXT_DFL"
             if (hex_common.is_new_result(tag)):
                 newv = "EXT_NEW"
             elif (hex_common.is_tmp_result(tag)):
                 newv = "EXT_TMP"
             f.write("    const int %s = insn->regno[%d];\n" % (regN, 
regno))
             f.write("    ctx_log_vreg_write%s(ctx, %s, %s, %s);\n" % 
(pair, regN, newv, predicated))
         elif (regtype == "Q" and regid in {"d", "e", "x"}):
             f.write("    const int %s = insn->regno[%d];\n" % (regN, 
regno))
             f.write("    ctx_log_qreg_write(ctx, %s);\n" % (regN))
         elif (regtype == "M"        and regid == "u" or
               regtype in {"G", "S"} and regid in {"dd", "d", "ss", "s"} or
               regtype in {"P", "Q"} and regid in {"s", "t", "u", "v"} or
               regtype == "R"        and regid in {"s", "t", "u", "v", 
"ss", "tt"} or
               regtype == "C"        and regid in {"s", "ss"} or
               regtype == "V"        and regid in {"s", "u", "v", "w", 
"uu", "vv"}):
             f.write("//    const int %s = insn->regno[%d];\n" % (regN, 
regno))
         else:
             print("Bad register parse: ", regtype, regid)

     def analyze_opn_new(f, tag, regtype, regid, regno):
         regN = "%s%sN" % (regtype, regid)
         if (regtype == "N" and regid in {"s", "t"} or
             regtype == "P" and regid in {"t", "u", "v"} or
             regtype == "O" and regid == "s"):
             f.write("//    const int %s = insn->regno[%d];\n" % (regN, 
regno))
         else:
             print("Bad register parse: ", regtype, regid)

Note: the above example also includes changes made in patch 7.

Otherwise,

Reviewed-by: Anton Johansson <anjo@rev.ng>


