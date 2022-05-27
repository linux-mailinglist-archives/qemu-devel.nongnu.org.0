Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C38E05366F9
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 20:37:27 +0200 (CEST)
Received: from localhost ([::1]:54514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuepy-00063r-Of
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 14:37:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYM-00065j-EZ
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:14 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f]:40851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueYJ-0003UM-4m
 for qemu-devel@nongnu.org; Fri, 27 May 2022 14:19:14 -0400
Received: by mail-pf1-x42f.google.com with SMTP id i18so4963231pfk.7
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 11:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I3HZX6oizcr2K30QR5msGHRUpSklskaYLnqbkE308qk=;
 b=vNuKBOr6klukZhNBHvvEaobMx59LA2gWiiSOLluP4H3b1bAHHMoqD22wC4KKjLxwbi
 mv6tj+z19+OE/bkezVYMYEYW/8PZyJOnHds+lUbsLwLcOv7Ssp1oMU+OLKsa3Ciqhhqe
 E+bSt6sQuJPCOn79I5Pi2lYXKNMBCD/POD5fjUapocTxh8VZHErX+4dJRvPlz/RFAzyi
 puUDah7OvcBXVECLb7bHIuPAjfBs5EvdjaqFIx0fCDqYmk8PacuV0Lqh6OrWA3ZlCHqa
 Ufls78+JzWkRVroXt7yS5pEfuXYwLTHVaux0c6VBBW1SKvdm69vZSnw9WGNMTR04Zwyl
 NrGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I3HZX6oizcr2K30QR5msGHRUpSklskaYLnqbkE308qk=;
 b=yy/NV26zqfRYxjRwNTPx0DGF0B0p6oDdkA/lHHsL+74LqJRo3YQHuSksTlcO422yCR
 dknlkt/DXafSVRhCBeKhgsK2GOC8R8+f9i5j7CB7bN+/oyaQIgRr9Xz0zsMas33rtOfx
 UBlQkgSBOYNeCwzOE35wyJyYoIhu8bBAnaN/tYk2+T5QHNnBp9y/l5pQN5jWjvFOQbXE
 0rUuHbFwklMNXs1o6m5twjNIGzptEBuDjeN0RGetnJZVoxpkFJG3AF0Tqt3g2Xe/9ml7
 Ne64t0XuAGR/QzNSWdpr/vAy2vPNrnPl/zjJq6ShMNLNGmwcnTneQHqgYblRtCAN/yWE
 j8cg==
X-Gm-Message-State: AOAM533Se+0DzXavFsOcko3taDP8I+F6UConOE7RwIP0Hiv1U6F4Mr2j
 2nj8xUGmQEF+srykYdb4taXyftaJqe1Y+A==
X-Google-Smtp-Source: ABdhPJyceLK9gQguijdgGBXxQ6nWZJL5S/VCHIixy5tWaYWsXrYh4O0iqRtDOgs/1PkJEpWLiZecrg==
X-Received: by 2002:a63:d012:0:b0:3fb:b3d6:122 with SMTP id
 z18-20020a63d012000000b003fbb3d60122mr2882250pgf.142.1653675549082; 
 Fri, 27 May 2022 11:19:09 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a17090ae50500b001deb3cbd8f1sm1911612pjy.27.2022.05.27.11.19.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:19:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 000/114] target/arm: Rewrite sve feature tests
Date: Fri, 27 May 2022 11:17:13 -0700
Message-Id: <20220527181907.189259-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There are SME instructions within the SVE encoding space, and
technically SME does not require SVE.  Thus we need to move:

    if (!dc_isar_feature(aa64_sve, s) || !disas_sve(s, insn)) {

into each individual instruction.  Use a macro trick similar to
what we've been using over in target/ppc/.


r~


Richard Henderson (114):
  target/arm: Introduce TRANS, TRANS_FEAT
  target/arm: Move null function and sve check into gen_gvec_ool_zz
  target/arm: Use TRANS_FEAT for gen_gvec_ool_zz
  target/arm: Move null function and sve check into gen_gvec_ool_zzz
  target/arm: Introduce gen_gvec_ool_arg_zzz
  target/arm: Use TRANS_FEAT for gen_gvec_ool_arg_zzz
  target/arm: Use TRANS_FEAT for do_sve2_zzz_ool
  target/arm: Move null function and sve check into gen_gvec_ool_zzzz
  target/arm: Use TRANS_FEAT for gen_gvec_ool_zzzz
  target/arm: Introduce gen_gvec_ool_arg_zzzz
  target/arm: Use TRANS_FEAT for do_sve2_zzzz_ool
  target/arm: Use TRANS_FEAT for gen_gvec_ool_arg_zzzz
  target/arm: Rename do_zzxz_ool to gen_gvec_ool_arg_zzxz
  target/arm: Use TRANS_FEAT for gen_gvec_ool_arg_zzxz
  target/arm: Use TRANS_FEAT for do_sve2_zzz_data
  target/arm: Use TRANS_FEAT for do_sve2_zzzz_data
  target/arm: Use TRANS_FEAT for do_sve2_zzw_data
  target/arm: Use TRANS_FEAT for USDOT_zzzz
  target/arm: Move null function and sve check into gen_gvec_ool_zzp
  target/arm: Introduce gen_gvec_ool_arg_zpz
  target/arm: Use TRANS_FEAT for gen_gvec_ool_arg_zpz
  target/arm: Use TRANS_FEAT for do_sve2_zpz_data
  target/arm: Rename do_zpzi_ool to gen_gvec_ool_arg_zpzi
  target/arm: Use TRANS_FEAT for gen_gvec_ool_arg_zpzi
  target/arm: Move null function and sve check into gen_gvec_ool_zzzp
  target/arm: Introduce gen_gvec_ool_arg_zpzz
  target/arm: Use TRANS_FEAT for gen_gvec_ool_arg_zpzz
  target/arm: Use TRANS_FEAT for do_sve2_zpzz_ool
  target/arm: Merge gen_gvec_fn_zz into do_mov_z
  target/arm: Move null function and sve check into gen_gvec_fn_zzz
  target/arm: Rename do_zzz_fn to gen_gvec_fn_arg_zzz
  target/arm: More use of gen_gvec_fn_arg_zzz
  target/arm: Use TRANS_FEAT for gen_gvec_fn_arg_zzz
  target/arm: Use TRANS_FEAT for do_sve2_fn_zzz
  target/arm: Use TRANS_FEAT for RAX1
  target/arm: Introduce gen_gvec_fn_arg_zzzz
  target/arm: Use TRANS_FEAT for do_sve2_zzzz_fn
  target/arm: Introduce gen_gvec_fn_zzi
  target/arm: Use TRANS_FEAT for do_zz_dbm
  target/arm: Hoist sve access check through do_sel_z
  target/arm: Introduce gen_gvec_fn_arg_zzi
  target/arm: Use TRANS_FEAT for do_sve2_fn2i
  target/arm: Use TRANS_FEAT for do_vpz_ool
  target/arm: Use TRANS_FEAT for do_shift_imm
  target/arm: Introduce do_shift_zpzi
  target/arm: Use TRANS_FEAT for do_shift_zpzi
  target/arm: Use TRANS_FEAT for do_zpzzz_ool
  target/arm: Move sve check into do_index
  target/arm: Use TRANS_FEAT for do_index
  target/arm: Use TRANS_FEAT for do_adr
  target/arm: Use TRANS_FEAT for do_predset
  target/arm: Use TRANS_FEAT for RDFFR, WRFFR
  target/arm: Use TRANS_FEAT for do_pfirst_pnext
  target/arm: Use TRANS_FEAT for do_EXT
  target/arm: Use TRANS_FEAT for do_perm_pred3
  target/arm: Use TRANS_FEAT for do_perm_pred2
  target/arm: Move sve zip high_ofs into simd_data
  target/arm: Use gen_gvec_ool_arg_zzz for do_zip, do_zip_q
  target/arm: Use TRANS_FEAT for do_zip, do_zip_q
  target/arm: Use TRANS_FEAT for do_clast_vector
  target/arm: Use TRANS_FEAT for do_clast_fp
  target/arm: Use TRANS_FEAT for do_clast_general
  target/arm: Use TRANS_FEAT for do_last_fp
  target/arm: Use TRANS_FEAT for do_last_general
  target/arm: Use TRANS_FEAT for SPLICE
  target/arm: Use TRANS_FEAT for do_ppzz_flags
  target/arm: Use TRANS_FEAT for do_sve2_ppzz_flags
  target/arm: Use TRANS_FEAT for do_ppzi_flags
  target/arm: Use TRANS_FEAT for do_brk2, do_brk3
  target/arm: Use TRANS_FEAT for MUL_zzi
  target/arm: Reject dup_i w/ shifted byte early
  target/arm: Reject add/sub w/ shifted byte early
  target/arm: Reject copy w/ shifted byte early
  target/arm: Use TRANS_FEAT for ADD_zzi
  target/arm: Use TRANS_FEAT for do_zzi_sat
  target/arm: Use TRANS_FEAT for do_zzi_ool
  target/arm: Introduce gen_gvec_{ptr,fpst}_zzzz
  target/arm: Use TRANS_FEAT for FMMLA
  target/arm: Move sve check into gen_gvec_fn_ppp
  target/arm: Implement NOT (prediates) alias
  target/arm: Use TRANS_FEAT for SEL_zpzz
  target/arm: Use TRANS_FEAT for MOVPRFX
  target/arm: Use TRANS_FEAT for FMLA
  target/arm: Use TRANS_FEAT for BFMLA
  target/arm: Rename do_zzz_fp to gen_gvec_ool_fpst_arg_zzz
  target/arm: Use TRANS_FEAT for DO_FP3
  target/arm: Use TRANS_FEAT for FMUL_zzx
  target/arm: Use TRANS_FEAT for FTMAD
  target/arm: Move null function and sve check into do_reduce
  target/arm: Use TRANS_FEAT for do_reduce
  target/arm: Use TRANS_FEAT for FRECPE, FRSQRTE
  target/arm: Expand frint_fns for MO_8
  target/arm: Rename do_zpz_ptr to gen_gvec_ool_fpst_arg_zpz
  target/arm: Move null function and sve check into do_frint_mode
  target/arm: Use TRANS_FEAT for do_frint_mode
  target/arm: Use TRANS_FEAT for FLOGB
  target/arm: Use TRANS_FEAT for do_ppz_fp
  target/arm: Rename do_zpzz_ptr to gen_gvec_fpst_arg_zpzz
  target/arm: Use TRANS_FEAT for gen_gvec_fpst_arg_zpzz
  target/arm: Use TRANS_FEAT for FCADD
  target/arm: Introduce gen_gvec_fpst_zzzzp
  target/arm: Use TRANS_FEAT for gen_gvec_fpst_zzzzp
  target/arm: Move null function and sve check into do_fp_imm
  target/arm: Use TRANS_FEAT for DO_FP_IMM
  target/arm: Use TRANS_FEAT for DO_FPCMP
  target/arm: Remove assert in trans_FCMLA_zzxz
  target/arm: Use TRANS_FEAT for FCMLA_zzxz
  target/arm: Use TRANS_FEAT for do_narrow_extract
  target/arm: Use TRANS_FEAT for do_shll_tb
  target/arm: Use TRANS_FEAT for do_shr_narrow
  target/arm: Use TRANS_FEAT for do_FMLAL_zzzw
  target/arm: Use TRANS_FEAT for do_FMLAL_zzxw
  target/arm: Add sve feature check for remaining trans_* functions
  target/arm: Remove aa64_sve check from before disas_sve

 target/arm/translate.h     |   11 +
 target/arm/sve.decode      |   57 +-
 target/arm/sve_helper.c    |    6 +-
 target/arm/translate-a64.c |    2 +-
 target/arm/translate-sve.c | 5367 ++++++++++++++----------------------
 5 files changed, 2058 insertions(+), 3385 deletions(-)

-- 
2.34.1


