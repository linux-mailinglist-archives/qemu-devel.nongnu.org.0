Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5746937C4DF
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 17:34:25 +0200 (CEST)
Received: from localhost ([::1]:35554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgqsS-0000Da-C9
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 11:34:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgqko-00063a-K8
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:26:30 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:38598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgqkk-0005WW-Ag
 for qemu-devel@nongnu.org; Wed, 12 May 2021 11:26:30 -0400
Received: by mail-ej1-x62c.google.com with SMTP id b25so35531199eju.5
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 08:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fzpxr/EA7yYE24S2wHQnJAB8JyY/qA+etwkIXcO1lYc=;
 b=iUde20x0hZBKpZlX/3y5WWOVCKqhN9Ie3oN4VyBjp8i/SQDacWu1WErv+E6lYT8765
 m5qMgWPVznikCdxhx+r2lyomRztoLUAklJH3eQRtqEuGQ1Z5yhh0YyBtsnPL6+JF5IL8
 aDV4Ae3PRptLWXvWcHWByYc4hEOFh/AXdMCOLw0J9q6Gbce/t4KFDsQeT9TW66i49e5F
 gGRnFnE6Cyf52StNP+lkUkT7EBSzlX4UCNhLtb2cka31LgFSP5MOGCjRC+iiikCzW2wn
 aXKCyjSZmFYn69y5yShviB5bACvcfToUGSg5DB3NfTF9CPtFyeDNXlxs2CgiiVfbMicZ
 wf3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fzpxr/EA7yYE24S2wHQnJAB8JyY/qA+etwkIXcO1lYc=;
 b=t2vIoYiFV/Ukul5poM1tkPgmMk8tMuatTpaAf54kpJjYPzB55QiRf58EPMYC+IW8xR
 JGagMzaUiZtiQKZxgA3G1iGy9FOSE6Ge2S+h+GEWxDWgaqavvdi0mKd5CiUK22a6emi5
 AHgdUy0oV1WkbmNx67P0H+1x0XCvQUH1mTc4Wtc6T2LtpZMrLQAy//a0NX/1Pm1ao1bu
 5SfK0r5udg9g1+CtcngzCmVj/Pzm1URknVNafz574GDkrfzeGuvL0DoAiKKa4V/iKGmp
 5RQI24vf3pgVEZYcMAfrgykCN/iBBMO6/8NBU7c2dI07qgD9/ejk/a7I3ql+9TrU4Ciq
 1kdg==
X-Gm-Message-State: AOAM5322IgNGmlCBwvpc0oPtPCudjeQtcNNisxfKt/68PrND6tWderk0
 eFGv0/3W0Ebm+vfumHnbeQOAHoUUGl3X3iKwzq9RWA==
X-Google-Smtp-Source: ABdhPJxh5VSFe6GykrHs+RKuLOpiIWnpVlvpUYaiLCA6BAUm44izYvfqkuDwZ91m9iVVNbALZkLt6DCLnsBmCI1yZPc=
X-Received: by 2002:a17:906:eced:: with SMTP id
 qt13mr37894081ejb.382.1620833184927; 
 Wed, 12 May 2021 08:26:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-42-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-42-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 May 2021 16:25:11 +0100
Message-ID: <CAFEAcA8BeXAM7fHb5EzS65__ubRL+6aUnEpMK+7tpS9af+3SLw@mail.gmail.com>
Subject: Re: [PATCH v6 41/82] target/arm: Implement SVE2 RSUBHNB, RSUBHNT
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 22:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> From: Stephen Long <steplong@quicinc.com>
>
> This completes the section 'SVE2 integer add/subtract narrow high part'
>
> Signed-off-by: Stephen Long <steplong@quicinc.com>
> Message-Id: <20200417162231.10374-5-steplong@quicinc.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

