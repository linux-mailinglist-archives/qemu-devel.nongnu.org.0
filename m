Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 197DF6F7CBC
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 08:05:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puoXX-0001pk-W0; Fri, 05 May 2023 02:03:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1puoXU-0001nh-BP
 for qemu-devel@nongnu.org; Fri, 05 May 2023 02:03:32 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shorne@gmail.com>) id 1puoXS-0003bs-L6
 for qemu-devel@nongnu.org; Fri, 05 May 2023 02:03:32 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f19a7f9424so13537635e9.2
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 23:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683266608; x=1685858608;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=erMcGjH/AfRnlWuu6TjU9DHb370xbuRseZpLF+74N84=;
 b=iYCJFppdVqu+7nVvWKBLbHn1h9LVOhQu9CNPIbVkvzZhN+4wnPqfqaBDG8GQQ8Htl1
 Az2jEQQd+2b8TRqxQ9kPekQ5tRIYBM493Z1a3R5J/dct64A/fQuJVDRLUeQvQpCg66fT
 eEQHWpj5cjf6ypZ7SX8VcVPNRf/ZA9lTycPNTkPnxG1oNNJAzpRQ3urykN72HWqcdWuh
 KCUPsi3PPo6I3DUbWPDcwR3BL4worPw1zQYta6WahqDv8W6SJmPJY7JDG8vMhdgfODOA
 dex7Wh6cCFOzJTFziKux482A/0rqQ8PoccNzBvnmj39oeFRbGEDLlN6kOq/GXNObHnHm
 5SdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683266608; x=1685858608;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=erMcGjH/AfRnlWuu6TjU9DHb370xbuRseZpLF+74N84=;
 b=R8sBBL/XtdcGCXFgHVt8Qh+9IXwMN2fKDEzcb/oG/UYPY7K3MPjSV0Pn50ZnfGusnZ
 0VWun2Hg1+HTCHimUkR2HRviuUlZS9iIGfVF1bET5UMV5hu1GzRFKn8lb1vKCRI6Xs63
 xZHrdwFh96voTUHfMTKLlB6s5kjG6qGPPq51roQzEVn5lj2JxRrXVAVTeHzYOEjdrm4Y
 6j2PcsDia9zTwdZzemIIPkyIgzn0DDeP8L3Y+M2JyYg+hzhhrumJTl/quFdrs1AAppPR
 9uUiTqC7FwFv1Q1Moo8YUGKXRQw0VGRIoSMFVPUyIir9Jyp/QG42slvyQN3YqYqrj8lX
 a8cA==
X-Gm-Message-State: AC+VfDzbLI8Y5WR04gs5GT1BNvQ94YnlEejZlktyGF+LdeaSLrIU8CYB
 Z4sPK5L5z7w+20MMvwZ4MJo=
X-Google-Smtp-Source: ACHHUZ6m/Ea9osLy+hV7kqIKKSTUoKDq6BRsym2qJmOhsJY5rFLy7oyXICSj4gS6DULxSeDefsTMFQ==
X-Received: by 2002:adf:fe51:0:b0:306:42e2:5ec3 with SMTP id
 m17-20020adffe51000000b0030642e25ec3mr440635wrs.6.1683266607807; 
 Thu, 04 May 2023 23:03:27 -0700 (PDT)
Received: from localhost (cpc1-brnt4-2-0-cust862.4-2.cable.virginm.net.
 [86.9.131.95]) by smtp.gmail.com with ESMTPSA id
 n9-20020a5d51c9000000b0030635f6949fsm1204920wrv.103.2023.05.04.23.03.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 23:03:27 -0700 (PDT)
Date: Fri, 5 May 2023 07:03:26 +0100
From: Stafford Horne <shorne@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] scripts/coverity-scan: Add xtensa and openrisc components
Message-ID: <ZFScLt0DvCqiG6IM@antec>
References: <20230504134526.2748157-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230504134526.2748157-1-peter.maydell@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=shorne@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, May 04, 2023 at 02:45:26PM +0100, Peter Maydell wrote:
> We have two target architectures which don't have Coverity components
> defined for them: xtensa and openrisc. Add them.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> As usual with coverity components, these will need to be added
> manually via the scanner UI, since it has no import-from-file...
> 
>  scripts/coverity-scan/COMPONENTS.md | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/scripts/coverity-scan/COMPONENTS.md b/scripts/coverity-scan/COMPONENTS.md
> index 7c48e0f1d21..add7c5a279c 100644
> --- a/scripts/coverity-scan/COMPONENTS.md
> +++ b/scripts/coverity-scan/COMPONENTS.md
> @@ -143,3 +143,9 @@ loongarch
>  
>  riscv
>    ~ (/qemu)?((/include)?/hw/riscv/.*|/target/riscv/.*|/hw/.*/(riscv_|ibex_|sifive_).*)
> +
> +openrisc
> +  ~ (/qemu)?((/include)?/hw/openrisc/.*|/target/openrisc/.*)

This looks good to me for OpenRISC.  Where can we view the coverity reports?

  Is it this?: https://scan.coverity.com/projects/378

Acked-by: Stafford Horne <shorne@gmail.com>

> +xtensa
> +  ~ (/qemu)?((/include)?/hw/xtensa/.*|/target/xtensa/.*)

