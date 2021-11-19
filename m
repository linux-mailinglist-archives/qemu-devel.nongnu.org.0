Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5357457268
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 17:08:53 +0100 (CET)
Received: from localhost ([::1]:58142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo6RY-0001IA-MH
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 11:08:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6O6-0004nK-Rr
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:05:19 -0500
Received: from [2a00:1450:4864:20::434] (port=39534
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mo6O0-000468-HB
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 11:05:15 -0500
Received: by mail-wr1-x434.google.com with SMTP id d27so18980699wrb.6
 for <qemu-devel@nongnu.org>; Fri, 19 Nov 2021 08:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hekveUJCHgxSVmAyozZJTlh9tyG8w9WdIYIXnNAfbFc=;
 b=iR41ae+e8HJ+E0IKFSaad8goyiKCK0VVxjabxDxETuZQaGlGDIPsImLEKv4zW9nBMe
 dPp/hWCaGlAtX36fmKQEz7PA4p++xovo5A4gWBFjkEzvAn+b2KNJFKZLeC4V42eSxWQb
 JtrfiovgF8Aw+V2HZulU8LP+76vM1zzhshUXMWIOg9+1zT1sQLkCROk6woALxBK0VG8e
 n2cUynPHlp/Y/kj/o0it2i501Tw9LPbREL3IbJkl+kPTTvs5QJ8/8ahrjzUYAVfPJHIK
 K8Boo9YVcOze6+axtV61NjkGkYxbqPkgwGF1IARxel4q1pGpIZi22G2SddsM3UuaMQVR
 NEJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hekveUJCHgxSVmAyozZJTlh9tyG8w9WdIYIXnNAfbFc=;
 b=HxipP1RyHjlZyOptDRleJtF6A+P7ZB3E8IfFTU1CmN7KHHuqfK7oowYr4JrxWCUdtQ
 ZGtYf6wFI7F+hb3v392DIzkgRG8OYMYTJmaSlu7YsOTVNl3cI0Hwe9oUi9UU14o9m8dY
 u6EyaZLNpwXfOOvADUdlRDxtNVeh4L6uyF0GdA+kb6fJ0pHAzkErv3r9fZR4Mpg9hp2W
 kv8RZMiNUV504MZ8AmDYdvn/mCdsb8iIve2TIOKvptpArkWN32jxSetY53DvkiXI5uEB
 qMdyEJyFJbd42epCjiC+97LgTW7NRf+BhltIfavyHU0vZDVA0RnF2h6HrJju1uiLj1ni
 9cHg==
X-Gm-Message-State: AOAM531sZ85NTE06BkZGojTF0HQWAvHo/v9qOGy/OLpBVcJc78PtiqV4
 ozm2K+WLf5grSr1kM8mWmfWnIuEZ8ZiJAljBwj4=
X-Google-Smtp-Source: ABdhPJxUZfS0NjyNfFv4DCnp8Bf1auxWRXo4FYvUPYW+/hRJttY5YN2FqauM98mCwuN89OiYvein7A==
X-Received: by 2002:adf:fa0b:: with SMTP id m11mr8652687wrr.152.1637337906583; 
 Fri, 19 Nov 2021 08:05:06 -0800 (PST)
Received: from localhost.localdomain
 (165.red-37-158-79.dynamicip.rima-tde.net. [37.158.79.165])
 by smtp.gmail.com with ESMTPSA id q84sm14044877wme.3.2021.11.19.08.05.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 08:05:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH for-7.0 00/35] target/ppc fpu fixes and cleanups
Date: Fri, 19 Nov 2021 17:04:27 +0100
Message-Id: <20211119160502.17432-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, alex.bennee@linaro.org,
 clg@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a partial patch set showing the direction I believe
the cleanups should go, as opposed to a complete conversion.

I add a bunch of float_flag_* bits that diagnose the reason
for most float_flag_invalid, as guided by the requirements
of the PowerPC VX* bits.  I have converted some helpers to
use these new flags but not all.  A good signal for unconverted
routines is the use of float*_is_signalling_nan, which should
now be using float_flag_invalid_snan.

I added float64x32_* arithmetic routines, which take float64
arguments and round the result to the range and precision of
float32, while giving the result in float64 form.  This is
exactly what PowerPC requires for its single-precision math.
This fixes double-rounding problems that exist in the current
code, and are visible in the float_madds test.

I add test reference files for float_madds and float_convs
after fixing the bugs required to make the tests pass.


r~


Richard Henderson (35):
  softfloat: Extend float_exception_flags to 16 bits
  softfloat: Add flag specific to Inf - Inf
  softfloat: Add flag specific to Inf * 0
  softfloat: Add flags specific to Inf / Inf and 0 / 0
  softfloat: Add flag specific to sqrt(-x)
  softfloat: Add flag specific to convert non-nan to int
  softfloat: Add flag specific to signaling nans
  target/ppc: Update float_invalid_op_addsub for new flags
  target/ppc: Update float_invalid_op_mul for new flags
  target/ppc: Update float_invalid_op_div for new flags
  target/ppc: Move float_check_status from FPU_FCTI to translate
  target/ppc: Update float_invalid_cvt for new flags
  target/ppc: Fix VXCVI return value
  target/ppc: Remove inline from do_fri
  target/ppc: Use FloatRoundMode in do_fri
  target/ppc: Tidy inexact handling in do_fri
  target/ppc: Clean up do_fri
  target/ppc: Update fmadd for new flags
  target/ppc: Split out do_fmadd
  target/ppc: Do not call do_float_check_status from do_fmadd
  target/ppc: Split out do_frsp
  target/ppc: Update do_frsp for new flags
  target/ppc: Use helper_todouble in do_frsp
  target/ppc: Update sqrt for new flags
  target/ppc: Update xsrqpi and xsrqpxp to new flags
  target/ppc: Update fre to new flags
  softfloat: Add float64r32 arithmetic routines
  target/ppc: Add helpers for fmadds et al
  target/ppc: Add helper for fsqrts
  target/ppc: Add helpers for fadds, fsubs, fdivs
  target/ppc: Add helper for fmuls
  target/ppc: Add helper for frsqrtes
  target/ppc: Update fres to new flags and float64r32
  target/ppc: Use helper_todouble/tosingle in helper_xststdcsp
  test/tcg/ppc64le: Add float reference files

 include/fpu/softfloat-types.h      |  23 +-
 include/fpu/softfloat.h            |  14 +-
 target/ppc/helper.h                |  10 +
 fpu/softfloat.c                    | 114 ++++-
 target/ppc/fpu_helper.c            | 531 ++++++++++----------
 fpu/softfloat-parts.c.inc          |  57 ++-
 fpu/softfloat-specialize.c.inc     |  12 +-
 target/ppc/translate/fp-impl.c.inc |  44 +-
 tests/tcg/ppc64le/float_convs.ref  | 748 ++++++++++++++++++++++++++++
 tests/tcg/ppc64le/float_madds.ref  | 768 +++++++++++++++++++++++++++++
 10 files changed, 1996 insertions(+), 325 deletions(-)
 create mode 100644 tests/tcg/ppc64le/float_convs.ref
 create mode 100644 tests/tcg/ppc64le/float_madds.ref

-- 
2.25.1


