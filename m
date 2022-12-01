Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EDB63EA10
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Dec 2022 07:59:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0dWz-0006WJ-D0; Thu, 01 Dec 2022 01:58:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1p0dWc-0006V1-BP
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 01:58:26 -0500
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1p0dWY-0002VG-OO
 for qemu-devel@nongnu.org; Thu, 01 Dec 2022 01:58:24 -0500
Received: by mail-qt1-x836.google.com with SMTP id c15so433578qtw.8
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 22:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braap-org.20210112.gappssmtp.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=cWpbRkyL7jUKDBoiwFL5DebXUBNzshDnfRMk5fsO+68=;
 b=kymZFaZJNnQXti9hKj+bNkfctWhTsXKcjeliQ8JEXaQb6KJvRWCPK42JNl/nV9diFQ
 m0WdMnNNC5hktHUpfHtdyPE7jsXVYwrued2BdHxqO1/PcC8lfG9ZhBTdInnEv/Oz5VpN
 R8d9p4ZgViiXAHxolo++DJ9xEiuAWlZrmsLgkcU5UNJbBGC3PTrr49oUWHO8XsG6MOLq
 tF9Yni/NfbnS4Z+M1HMxTl5M/UUzZahRF4NaMoPmfDMwBIlBUpjuXeKtOZYJBaxrPpKG
 sLeoB1/dAS1ohbCxX1SKnC9n+uca0KssAccLoZ17AFq5tjebPdMivdX28KrCSVfW64tL
 3Kgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cWpbRkyL7jUKDBoiwFL5DebXUBNzshDnfRMk5fsO+68=;
 b=j8JXaxjfQFUENeQ1IZ81aA632WMzCTXHw4MAqPIejKsYkzidjk6rul4QUEo089EICk
 jvIqXzmd6weMBLI2yJV0RLFk26EnsSqrOhlSnxzHuMiQwnyC1eG3LXxzVicwkLkCFjlo
 6/o+zlqm+NistgxY7Y7izPF4oEItrKij4I18eJiNoBpJwJJqKn6wQaLQeZ3dKfVovSkS
 cn052g/jne9khLTpu8l2J/XrIXDe8WEcXvZGfE3JELWAN2NhERZ0vfLnfh8QcBqXNhNm
 ghPweiyDEag/mT4zvoWXVwtagP0A+iOc0FaXKH9CDtwqw1zWW+804e9QEg4pBDn+qn4Y
 SQkA==
X-Gm-Message-State: ANoB5pkAUm/YsVb7xoSzWaBuiY1/mQR32tYlbk321iBQow3nu7OKVFCF
 8x9YN2HtPajm5+F4EO/kAs0BBw==
X-Google-Smtp-Source: AA0mqf6GNfbKZfQ+Nw6wDCJxUb8bLQWZbSS5dYB8hKr+WtMcscpOgloICgF1LDaZdwSZLRLK9rfzLQ==
X-Received: by 2002:ac8:72d0:0:b0:3a5:9e38:9f4 with SMTP id
 o16-20020ac872d0000000b003a59e3809f4mr44291524qtp.532.1669877898052; 
 Wed, 30 Nov 2022 22:58:18 -0800 (PST)
Received: from localhost ([96.224.56.196]) by smtp.gmail.com with ESMTPSA id
 l5-20020a05620a28c500b006cf19068261sm2860310qkp.116.2022.11.30.22.58.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 22:58:17 -0800 (PST)
Date: Thu, 1 Dec 2022 01:55:32 -0500
From: Emilio Cota <cota@braap.org>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, ncopa@alpinelinux.org,
 Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] linux-user,bsd-user: re-exec with G_SLICE=always-malloc
Message-ID: <Y4hP5HS8L4O6KsVO@cota-l14>
References: <20221004120047.857591-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221004120047.857591-1-berrange@redhat.com>
Received-SPF: softfail client-ip=2607:f8b0:4864:20::836;
 envelope-from=cota@braap.org; helo=mail-qt1-x836.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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

On Tue, Oct 04, 2022 at 13:00:47 +0100, Daniel P. Berrangé wrote:
(snip)
> Can't say I especially like this but I'm out of other ideas for how
> to guarantee a solution. Users can't set env vars prior to launching
> QEMU user emulators when using binfmt.

An alternative is to not use GSlice between fork/exec. I'm
not sure if within that region there are other users besides
GTree (GArray perhaps?), but if there aren't, then just using
a different binary tree implementation should do.

Untested patches using ccan's AVL tree: 
  https://github.com/cota/qemu/commits/avl

Would that be more palatable?

Thanks,
		Emilio

