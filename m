Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D796AFAB9
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 00:49:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZh1m-0008PI-St; Tue, 07 Mar 2023 18:47:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZh1l-0008P4-EX
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 18:47:29 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZh1j-0002fG-4P
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 18:47:29 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 m25-20020a7bcb99000000b003e7842b75f2so154046wmi.3
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 15:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678232845;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5kv47cNquk8yhKac7MEnq6L9Leh5mHoeFVxotW6dHYI=;
 b=ZX8YkVJEV+wwuOC34Sc65TVRiVOC4ItVRt8E5WT0VZSX9Q5NM0VtQDhnbo5/jobKJX
 eBM6EnLYtm0TA0x7hvOZOuiFb/R4zqkRG5ngmN6kBwBDjq735D0nwP+5pCnHdknFgg1+
 hD5eEoDBGce/u+8HpPyrE1zPUhr68RW5aVly/E9kYfe8n3O/PUXucd7pjoLVDWomXb/h
 dFAsDQdwNE5NM+xXGIskvA1Yqbkc9cciZu7w5gS5EHE60QI1oL3vh6JRMR7BxDwNp76+
 6rquXO3Nbn3YDoVHQXk8cElXF/JfNViT+calwzAWAum/zRoL3lJNpJOF0CmztTkW1WwR
 I5Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678232845;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5kv47cNquk8yhKac7MEnq6L9Leh5mHoeFVxotW6dHYI=;
 b=Q7PdLxiHR4of/0H4BmdjKasoZrUg6dGqlTuzo2hjwaMzPxSPOSZIqfXq8rcYuV6DMv
 jCljJ7Het4e1f52Y0UGe69Ipke9D2aoCxUyDXyto2UrqiMn+IHPff/yUr8eDCoxFt8jN
 /LG0UOCclOm2ZkxMx7A4VfItWtZSHXF1yF0GW5g1JlG5QH7ti6PPdBnN25lrMe5+hNLc
 ftuN49Mq730Qf74KgytZJXflihU8Dt4OMEe57WlXHEaEV2Rrh7C9joA5STLEVP3QSNL2
 GUsl798guiHbVWZGYq/++UaUoKhbT0glOYedDwd0jds7oOn8bhV2CMlRHENz8R15+FP6
 qX0A==
X-Gm-Message-State: AO0yUKWkHYXruaPrzVdd0PwPRucPmeK3MQaZq1EZwjw0e299XiB+RUK+
 r45Zk6kgMVvWqFH+8PDGRckui+M8oTsDH/PTEiQ=
X-Google-Smtp-Source: AK7set8FK5KcTxO4T50ih7nUt4Lvi0/LZ7agMeEoA69EbAxW73WGwT0wyN8uj82ieOH9LWmT3EubHA==
X-Received: by 2002:a05:600c:3b0c:b0:3eb:2b88:999f with SMTP id
 m12-20020a05600c3b0c00b003eb2b88999fmr13796924wms.5.1678232845517; 
 Tue, 07 Mar 2023 15:47:25 -0800 (PST)
Received: from localhost.localdomain (57.red-88-29-179.dynamicip.rima-tde.net.
 [88.29.179.57]) by smtp.gmail.com with ESMTPSA id
 u12-20020a05600c00cc00b003e1202744f2sm17648526wmm.31.2023.03.07.15.47.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Mar 2023 15:47:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Subject: [PULL 02/20] target/mips: Replace [g_]assert(0) ->
 g_assert_not_reached()
Date: Wed,  8 Mar 2023 00:46:53 +0100
Message-Id: <20230307234711.55375-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230307234711.55375-1-philmd@linaro.org>
References: <20230307234711.55375-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

In order to avoid warnings such commit c0a6665c3c ("target/i386:
Remove compilation errors when -Werror=maybe-uninitialized"),
replace all assert(0) and g_assert(0) by g_assert_not_reached().

Remove any code following g_assert_not_reached().

See previous commit for rationale.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230221232520.14480-4-philmd@linaro.org>
---
 target/mips/sysemu/physaddr.c |   3 +-
 target/mips/tcg/msa_helper.c  | 104 +++++++++++++++++-----------------
 2 files changed, 53 insertions(+), 54 deletions(-)

diff --git a/target/mips/sysemu/physaddr.c b/target/mips/sysemu/physaddr.c
index 2970df8a09..05990aa5bb 100644
--- a/target/mips/sysemu/physaddr.c
+++ b/target/mips/sysemu/physaddr.c
@@ -70,8 +70,7 @@ static int is_seg_am_mapped(unsigned int am, bool eu, int mmu_idx)
         /* is this AM mapped in current execution mode */
         return ((adetlb_mask << am) < 0);
     default:
-        assert(0);
-        return TLBRET_BADADDR;
+        g_assert_not_reached();
     };
 }
 
diff --git a/target/mips/tcg/msa_helper.c b/target/mips/tcg/msa_helper.c
index 736283e2af..29b31d70fe 100644
--- a/target/mips/tcg/msa_helper.c
+++ b/target/mips/tcg/msa_helper.c
@@ -5333,7 +5333,7 @@ void helper_msa_shf_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
     msa_move_v(pwd, pwx);
 }
@@ -5368,7 +5368,7 @@ void helper_msa_ ## helper ## _df(CPUMIPSState *env, uint32_t df,       \
         }                                                               \
         break;                                                          \
     default:                                                            \
-        assert(0);                                                      \
+        g_assert_not_reached();                                         \
     }                                                                   \
 }
 
@@ -5413,7 +5413,7 @@ void helper_msa_ldi_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         }
        break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 }
 
@@ -5461,7 +5461,7 @@ void helper_msa_ ## helper ## _df(CPUMIPSState *env, uint32_t df, uint32_t wd, \
         }                                                               \
         break;                                                          \
     default:                                                            \
-        assert(0);                                                      \
+        g_assert_not_reached();                                         \
     }                                                                   \
 }
 
@@ -5511,7 +5511,7 @@ void helper_msa_ ## helper ## _df(CPUMIPSState *env, uint32_t df,       \
         }                                                               \
         break;                                                          \
     default:                                                            \
-        assert(0);                                                      \
+        g_assert_not_reached();                                         \
     }                                                                   \
 }
 
@@ -5557,7 +5557,7 @@ static inline void msa_sld_df(uint32_t df, wr_t *pwd,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 }
 
@@ -5632,7 +5632,7 @@ void helper_msa_ ## func ## _df(CPUMIPSState *env, uint32_t df,         \
         pwd->d[1] = msa_ ## func ## _df(df, pws->d[1], pwt->d[1]);      \
         break;                                                          \
     default:                                                            \
-        assert(0);                                                      \
+        g_assert_not_reached();                                         \
     }                                                                   \
 }
 
@@ -5771,7 +5771,7 @@ void helper_msa_ ## func ## _df(CPUMIPSState *env, uint32_t df, uint32_t wd,  \
         pwd->d[1] = msa_ ## func ## _df(df, pwd->d[1], pws->d[1], pwt->d[1]); \
         break;                                                                \
     default:                                                                  \
-        assert(0);                                                            \
+        g_assert_not_reached();                                               \
     }                                                                         \
 }
 
@@ -5811,7 +5811,7 @@ static inline void msa_splat_df(uint32_t df, wr_t *pwd,
         }
        break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 }
 
@@ -5869,7 +5869,7 @@ void helper_msa_##FUNC(CPUMIPSState *env, uint32_t df, uint32_t wd, \
         MSA_LOOP_D;                                                 \
         break;                                                      \
     default:                                                        \
-        assert(0);                                                  \
+        g_assert_not_reached();                                     \
     }                                                               \
     msa_move_v(pwd, pwx);                                           \
 }
@@ -6090,7 +6090,7 @@ void helper_msa_insve_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         pwd->d[n] = (int64_t)pws->d[0];
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 }
 
@@ -6150,7 +6150,7 @@ void helper_msa_fill_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         }
        break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 }
 
@@ -6565,7 +6565,7 @@ static inline void compare_af(CPUMIPSState *env, wr_t *pwd, wr_t *pws,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, retaddr);
@@ -6596,7 +6596,7 @@ static inline void compare_un(CPUMIPSState *env, wr_t *pwd, wr_t *pws,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, retaddr);
@@ -6625,7 +6625,7 @@ static inline void compare_eq(CPUMIPSState *env, wr_t *pwd, wr_t *pws,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, retaddr);
@@ -6654,7 +6654,7 @@ static inline void compare_ueq(CPUMIPSState *env, wr_t *pwd, wr_t *pws,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, retaddr);
@@ -6683,7 +6683,7 @@ static inline void compare_lt(CPUMIPSState *env, wr_t *pwd, wr_t *pws,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, retaddr);
@@ -6712,7 +6712,7 @@ static inline void compare_ult(CPUMIPSState *env, wr_t *pwd, wr_t *pws,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, retaddr);
@@ -6741,7 +6741,7 @@ static inline void compare_le(CPUMIPSState *env, wr_t *pwd, wr_t *pws,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, retaddr);
@@ -6770,7 +6770,7 @@ static inline void compare_ule(CPUMIPSState *env, wr_t *pwd, wr_t *pws,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, retaddr);
@@ -6799,7 +6799,7 @@ static inline void compare_or(CPUMIPSState *env, wr_t *pwd, wr_t *pws,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, retaddr);
@@ -6828,7 +6828,7 @@ static inline void compare_une(CPUMIPSState *env, wr_t *pwd, wr_t *pws,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, retaddr);
@@ -6857,7 +6857,7 @@ static inline void compare_ne(CPUMIPSState *env, wr_t *pwd, wr_t *pws,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, retaddr);
@@ -7107,7 +7107,7 @@ void helper_msa_fadd_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, GETPC());
@@ -7137,7 +7137,7 @@ void helper_msa_fsub_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, GETPC());
@@ -7167,7 +7167,7 @@ void helper_msa_fmul_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, GETPC());
@@ -7198,7 +7198,7 @@ void helper_msa_fdiv_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, GETPC());
@@ -7245,7 +7245,7 @@ void helper_msa_fmadd_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, GETPC());
@@ -7280,7 +7280,7 @@ void helper_msa_fmsub_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, GETPC());
@@ -7317,7 +7317,7 @@ void helper_msa_fexp2_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, GETPC());
@@ -7371,7 +7371,7 @@ void helper_msa_fexdo_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, GETPC());
@@ -7417,7 +7417,7 @@ void helper_msa_ftq_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, GETPC());
@@ -7526,7 +7526,7 @@ void helper_msa_fmin_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
 
     } else {
 
-        assert(0);
+        g_assert_not_reached();
 
     }
 
@@ -7555,7 +7555,7 @@ void helper_msa_fmin_a_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         FMAXMIN_A(min, max, pwx->d[0], pws->d[0], pwt->d[0], 64, status);
         FMAXMIN_A(min, max, pwx->d[1], pws->d[1], pwt->d[1], 64, status);
     } else {
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, GETPC());
@@ -7628,7 +7628,7 @@ void helper_msa_fmax_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
 
     } else {
 
-        assert(0);
+        g_assert_not_reached();
 
     }
 
@@ -7657,7 +7657,7 @@ void helper_msa_fmax_a_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         FMAXMIN_A(max, min, pwx->d[0], pws->d[0], pwt->d[0], 64, status);
         FMAXMIN_A(max, min, pwx->d[1], pws->d[1], pwt->d[1], 64, status);
     } else {
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, GETPC());
@@ -7681,7 +7681,7 @@ void helper_msa_fclass_df(CPUMIPSState *env, uint32_t df,
         pwd->d[0] = float_class_d(pws->d[0], status);
         pwd->d[1] = float_class_d(pws->d[1], status);
     } else {
-        assert(0);
+        g_assert_not_reached();
     }
 }
 
@@ -7723,7 +7723,7 @@ void helper_msa_ftrunc_s_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, GETPC());
@@ -7753,7 +7753,7 @@ void helper_msa_ftrunc_u_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, GETPC());
@@ -7783,7 +7783,7 @@ void helper_msa_fsqrt_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, GETPC());
@@ -7832,7 +7832,7 @@ void helper_msa_frsqrt_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, GETPC());
@@ -7862,7 +7862,7 @@ void helper_msa_frcp_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, GETPC());
@@ -7892,7 +7892,7 @@ void helper_msa_frint_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, GETPC());
@@ -7946,7 +7946,7 @@ void helper_msa_flog2_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, GETPC());
@@ -7983,7 +7983,7 @@ void helper_msa_fexupl_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, GETPC());
@@ -8019,7 +8019,7 @@ void helper_msa_fexupr_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, GETPC());
@@ -8046,7 +8046,7 @@ void helper_msa_ffql_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     msa_move_v(pwd, pwx);
@@ -8072,7 +8072,7 @@ void helper_msa_ffqr_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     msa_move_v(pwd, pwx);
@@ -8100,7 +8100,7 @@ void helper_msa_ftint_s_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, GETPC());
@@ -8130,7 +8130,7 @@ void helper_msa_ftint_u_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, GETPC());
@@ -8166,7 +8166,7 @@ void helper_msa_ffint_s_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, GETPC());
@@ -8196,7 +8196,7 @@ void helper_msa_ffint_u_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
         }
         break;
     default:
-        assert(0);
+        g_assert_not_reached();
     }
 
     check_msacsr_cause(env, GETPC());
-- 
2.38.1


