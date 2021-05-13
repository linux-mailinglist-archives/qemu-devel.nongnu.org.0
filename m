Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88E0D37F609
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 12:56:25 +0200 (CEST)
Received: from localhost ([::1]:38734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lh90y-0007k6-L6
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 06:56:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lh8v2-0004Md-KB
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:50:16 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:37394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lh8uy-0004Jb-5l
 for qemu-devel@nongnu.org; Thu, 13 May 2021 06:50:16 -0400
Received: by mail-wr1-x434.google.com with SMTP id q5so7003350wrs.4
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 03:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=BcoYery22UugYJT/pJG9N7fEipWl+dHOGCKsr7sVGqk=;
 b=zdg6poNizq+OXa1juU8NQDgDWp7VShCRWVlmYmqiWy58Ndl2L6cislLWD9TUKPuYwD
 WXP0DX12RR8Vvq5x5ZhnWfKNeQHZvhUm25arcwCZdtXOPV59+zP8jt1VZejabe13IF9d
 Np8s26FsZqmwSPkMeESdGEGl8TRjsRg8xnME8d3yg3rvAMFE1n8m2xHATQZrSG0xuQtM
 4bZO7Rrz9SyV2eBQFjwmz6TIRlnzcthGGeC0LgTzPXKXRVqbAjOMh3OqswGfIHPWBvxk
 eHYxMbsWsD9ezedJ0zUsmcHQA04YReTJI7aGiamyfZNCYdhDgJEk3OWYYKMheOJeXBKC
 HHVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=BcoYery22UugYJT/pJG9N7fEipWl+dHOGCKsr7sVGqk=;
 b=if38lmj0KNF6KTuTzLx/6SbDYn4j74Rg/AP7mVRAZcn1PjwTMbrvu+JI7PH1B2xHtg
 ud2H0qxy2pypFXeeidBdCoqTxF2ggURU7iWGxyVhiKeuOoq00d/+nfBTJfRfXgBP+BY5
 4uDcnjbqt3fgqwDo+t+ndxj46cS68A2EAzgGDpqIfRKUVgV9r9Cj9h0P6w+04wY6GksO
 ylCL7Dcbv1ANgwHuGe1ZgZVPcfP1mv0nkuMK+FJ4+dAbWcy18ZBvLe6NhbmYnm1TZO/0
 2fZUwnqLvifPOAoNzirtFpNWdrGJ9QNcmxDl4Q1Sgns/uMHUEGdW0RKKrMKYGO/ympQe
 RNyw==
X-Gm-Message-State: AOAM531XpCiwXfrYPoWQSYXfQjhbjIfq7hCND03MQs0alT5DY/gcqEoO
 YkrG2tpoMWjitpvbv/47Fv+HJA==
X-Google-Smtp-Source: ABdhPJwuG81FkDT9SgUWefWwpSMaGr7j57Rl8wwLEcI8uzB6UXeTq+hdQxSvGGUIwi8u0Wo5nJS38Q==
X-Received: by 2002:adf:f88a:: with SMTP id u10mr6600429wrp.205.1620903010701; 
 Thu, 13 May 2021 03:50:10 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a76sm6685378wmd.16.2021.05.13.03.50.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 03:50:10 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5F4331FF7E;
 Thu, 13 May 2021 11:50:09 +0100 (BST)
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-41-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 40/72] softfloat: Tidy mul128By64To192
Date: Thu, 13 May 2021 11:50:05 +0100
In-reply-to: <20210508014802.892561-41-richard.henderson@linaro.org>
Message-ID: <877dk2ewm6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Clean up the formatting and variables; no functional change.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

