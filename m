Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C582F099B
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 21:02:44 +0100 (CET)
Received: from localhost ([::1]:42920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kygvD-0006b3-FJ
	for lists+qemu-devel@lfdr.de; Sun, 10 Jan 2021 15:02:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kyguC-00069g-HM
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 15:01:40 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:44403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kyguA-00031S-GG
 for qemu-devel@nongnu.org; Sun, 10 Jan 2021 15:01:40 -0500
Received: by mail-ed1-x534.google.com with SMTP id p22so16595403edu.11
 for <qemu-devel@nongnu.org>; Sun, 10 Jan 2021 12:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=vZ4kuMWCWQSWURlKS8DVUIkEj3IOMcRQOGTCjgYC6WQ=;
 b=s0PJKFxDcptXFjNmxuyd63hItRWaapIMa5f8lViV38PUrlGWEF+4pmr5jHCpluW3hM
 Rg2AdIeRPolqRAxW4kW24oU7BZcvLkHVEhlCmZlXV03ZFQ0Z0rHXmRba/qXMpfBtKgZc
 xgPQ9dJxtcuyouipEnap1WadF4hyQA+W8yMZMmrqZSP4P8KaS4r2clHVHurkKs1GKwiC
 UfF00z8Ozbb3JziOXUtNlhyBMoqVRG/9LkXZqKLxp6FVBPtzVb/JZYMdr2SNfrU4FnLu
 rSukTH5vzcBGrMn37pEhgTmUhUWuMJbIfF8T9T870wGVEgO0iYBDypqirnQHVWfLhlJL
 8T1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=vZ4kuMWCWQSWURlKS8DVUIkEj3IOMcRQOGTCjgYC6WQ=;
 b=lIz2TgfAoycJvrl4HhlGpmDKSi8e+3vmeCWYKKTvnN/0GdrIcXuj1msNE1Tj0sEyjI
 sqZHTkCsF09r7ZgZofNXM/8RNbxGDGoOxrxBmsubyxFzP2i2G6+xgJYuA7+FJh5O18Ji
 lcSEgk/yEtBx0pdc7W1MPRku5jy272OuN8Jo/BazrSc/xVL8vpLxIuOxDGwFL3P13hwY
 sRfKddn+gleYrien8BFb1vCSWw6o/eMOxjCsmJTkrMU5SvXXT+0RU/Mdk66az43d6Orw
 aw6ERY/SYPMnv1/kjq4dtZ75umB4gm0Bu0pJju4yCAzRQoOtIhT2+9y2UaKGdSgTUwr9
 1GBQ==
X-Gm-Message-State: AOAM533N5fPXdsnx+hLIE8dUHPoZUmCXlf244/QxrTP/LecIzgniNGUM
 Rc25yFPEdhgC2HaTzkHUvLq+9jLm5uclhvhldWmNlaklaTrpGA==
X-Google-Smtp-Source: ABdhPJyW0dRuK9XXANtzid5ujCMfC92rsS7DENYH8SWkfZMeH8NmtdwNIf5vJQ2KY3xmShf1DYgjAbzu3re9K1kK6fU=
X-Received: by 2002:aa7:cdc3:: with SMTP id h3mr11812194edw.52.1610308896171; 
 Sun, 10 Jan 2021 12:01:36 -0800 (PST)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 10 Jan 2021 20:01:25 +0000
Message-ID: <CAFEAcA8zF4aOPpjdks32H0Ay8XvvyAz+rU7AjcELnurDtFnGbg@mail.gmail.com>
Subject: coverity warning about possible missing error check in v9fs_request()
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi; Coverity has just come up with a new warning (CID 1438968) about
an unchecked error return value in the 9pfs code. (I'm not sure why
now -- the code in question is unchanged since 2011; probably some
other callsites changed enough to trigger the "other callsites check
return value" heuristic.)

Anyway, in the middle of v9fs_request() is this code:

    /* marshal the header details */
    proxy_marshal(iovec, 0, "dd", header.type, header.size);
    header.size += PROXY_HDR_SZ;

    retval = qemu_write_full(proxy->sockfd, iovec->iov_base, header.size);
    if (retval != header.size) {
        goto close_error;
    }

This is apparently the only call to proxy_marshal() that does not
check its return value -- is it missing a check?

thanks
-- PMM

