Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5636193ED
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 10:56:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqtQZ-0004bA-VG; Fri, 04 Nov 2022 05:55:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sir@cmpwn.com>) id 1oqtQS-0004a2-3i
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 05:55:48 -0400
Received: from out-182.mta0.migadu.com ([2001:41d0:1004:224b::b6])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sir@cmpwn.com>) id 1oqtQO-0008U8-Vl
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 05:55:47 -0400
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cmpwn.com; s=key1;
 t=1667555740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qSMbPOOtxD6D/qf+FUo7MTJk23mCD7Fvue/+rAJ6Xck=;
 b=T5fNmU7xvBSjlmzBWfP8tWeUEHIKfyNo0GnHmU4IxFid2vrK/g83v2L5KywkvTQiiOb2/8
 Qzmh9nKKoU+Mhqw/t5OSJVzCp7teVXBNNFncc1QVTLXHDEAjfsjLjZVoB9fydA3LPrHOrM
 urARIvjrIm3of8X4q0JT4uEilvLPEXzED5J2NWHrDFcWcJByXBdznkGfu+jysloFVDbJ00
 E5ej1/f7vLCUTnxntdVsBYrvddYccFysZgBkZwK68vtV0i+BgUlaOwH4MKZ092lfpZWSsY
 DbU4nnKjohWX7ryQIufPqBEaZn755+fy1E5RlHm1zpRAPCifd8KNyrozX6jbmg==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 04 Nov 2022 10:55:39 +0100
Message-Id: <CO3F6B8K38DE.1OTGB55K8CMB2@taiga>
Subject: Re: [PATCH v3] linux-user: implement execveat
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: "Drew DeVault" <sir@cmpwn.com>
To: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>, "Laurent
 Vivier" <laurent@vivier.eu>
Cc: <qemu-devel@nongnu.org>, "Helge Deller" <deller@gmx.de>
References: <20221103173212.3724698-1-sir@cmpwn.com>
 <b22ae5f1-41d9-3739-e219-a717b7ab8b98@linaro.org>
In-Reply-To: <b22ae5f1-41d9-3739-e219-a717b7ab8b98@linaro.org>
X-Migadu-Flow: FLOW_OUT
Received-SPF: pass client-ip=2001:41d0:1004:224b::b6;
 envelope-from=sir@cmpwn.com; helo=out-182.mta0.migadu.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri Nov 4, 2022 at 10:53 AM CET, Philippe Mathieu-Daud=C3=A9 wrote:
> Splitting this big patch would ease review:

It's only +165/-131, are you sure it really needs to be split?

> 1/ Replace safe_execve() by safe_execveat()
>
>     -safe_execve(exec_path, argp, envp))
>     +safe_execveat(AT_FDCWD, exec_path, argp, envp, 0));
>
> 2/ Extract do_execve()
>
> 3/ Convert do_execve() to do_execveat() adding dirfd/flags args
>
> 4/ Add TARGET_NR_execveat case

