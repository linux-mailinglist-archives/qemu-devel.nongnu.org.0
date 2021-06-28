Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5CE3B57F6
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 05:57:29 +0200 (CEST)
Received: from localhost ([::1]:40626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxiOm-0000T4-9n
	for lists+qemu-devel@lfdr.de; Sun, 27 Jun 2021 23:57:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lxiO0-0008E2-MT
 for qemu-devel@nongnu.org; Sun, 27 Jun 2021 23:56:40 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:36753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lxiNy-0000GX-TB
 for qemu-devel@nongnu.org; Sun, 27 Jun 2021 23:56:40 -0400
Received: by mail-pg1-x52d.google.com with SMTP id e33so14295977pgm.3
 for <qemu-devel@nongnu.org>; Sun, 27 Jun 2021 20:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=zJsnRnyuGWqSEXWv198zhXQdfGZSamLqV9uYr7USdnQ=;
 b=hojLtifT/rwt1XF7XgVFUrfjeqLWLvWoO7CxIuEGo2aibJd196pYsZkTja9rS1QkUZ
 092R5yTL2+3FSfDKIL7dVJCWu1VQJeMUTXsDAmS97+UBzEptS/0ISiTxwNZl8ywX046O
 J8TfK7XhDC/BqAi8dMcfTNLdKGNAx+pZVEhyaUlD+hQGkk6vxAk1TqZykdro1abbFXqR
 AMW+lbN4M7x35AVO1Bi5du3gxaJj7XP4bmoXDlcRhZsl4cpqY2bsJmvGbU8II0fCXHUc
 nQhTqbG7GhOhgDeT7BVissgYJmHruyJ2XovcTdeCtyrrRKxU3oGqLxBk3cW5ZPB/EZov
 UZog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zJsnRnyuGWqSEXWv198zhXQdfGZSamLqV9uYr7USdnQ=;
 b=qTgkH2j75pEGLfZq326dDO6ZYxuPw1MbvLPUsLFjnXBkcbhx7sk6Uvnb06oZGeR295
 iveGlHGbUPLkKAbic7nooRZueTRWiibZvcKlSJ9Zb4T/K8/B6jNOfwMyMOIN93anaieQ
 PCiuoMO6E25pLzc5Sp2AEPUYQx2QAsrcY1AKpPP+5YPpDCKJzsIVsLN1GvcyyvaOFiSq
 Oi1vR65PMXKuWdAhaN4LndfyKvalCBOUP/0r/meQ7l63R/uLbcbIVnxRH0FeDfvZIs/1
 U4mGwytAu3ytdrEoW/EQDwlMAlxUyLG5UzioPDZ3RmIuwz5lHS2l70VNwVzLsBSysb10
 p3zw==
X-Gm-Message-State: AOAM530+wI5MXJPSnAFb0gH5VOT5BYeKjB3k0t4VVfqffFzErUcAASDz
 xsdi2d2J2bh0KGbQn9P38EQ9lUYGk514Mg==
X-Google-Smtp-Source: ABdhPJxAdN/FtWssqNBM80p1YmX3oDPeOPjUSvv+Z3P/hEIT3O5nryy8V4M+vVcKKzlUvLgxPpJMnQ==
X-Received: by 2002:a63:ee11:: with SMTP id e17mr984163pgi.323.1624852596859; 
 Sun, 27 Jun 2021 20:56:36 -0700 (PDT)
Received: from [192.168.64.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
 by smtp.gmail.com with ESMTPSA id
 21sm12032280pfh.103.2021.06.27.20.56.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Jun 2021 20:56:36 -0700 (PDT)
Subject: Re: [PATCH v5 0/6] crypto: Make QCryptoTLSCreds* structures private
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210617121830.2776182-1-philmd@redhat.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Message-ID: <60171e96-dbee-1510-0d09-13ec64b7229f@gmail.com>
Date: Mon, 28 Jun 2021 12:56:33 +0900
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210617121830.2776182-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-1.765, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

qemu-nbd.c still refers to members of QCryptoTLSCreds* and can't be 
compiled.

Regards,
Akihiko Odaki

On 2021/06/17 21:18, Philippe Mathieu-Daudé wrote:
> Missing review: 5 & 6
> 
> Follow Daniel suggestion to simplify qcrypto TLS implementations,
> aiming to solve the OSX build failure.
> 
> Since v4:
> - Do not introduce qcrypto_tls_session_check_role (Richard, Daniel)
> - Added R-b tags
> 
> Since v3:
> - Added missing @errp docstring description
> 
> Since v2:
> - Add Error* argument (Daniel)
> - Move structure definitions to "tlscredspriv.h"
> 
> Philippe Mathieu-Daudé (6):
>    crypto/tlscreds: Introduce qcrypto_tls_creds_check_endpoint() helper
>    block/nbd: Use qcrypto_tls_creds_check_endpoint()
>    chardev/socket: Use qcrypto_tls_creds_check_endpoint()
>    migration/tls: Use qcrypto_tls_creds_check_endpoint()
>    ui/vnc: Use qcrypto_tls_creds_check_endpoint()
>    crypto: Make QCryptoTLSCreds* structures private
> 
>   crypto/tlscredspriv.h              | 45 ++++++++++++++++++++++++++++++
>   include/crypto/tls-cipher-suites.h |  6 ----
>   include/crypto/tlscreds.h          | 30 ++++++++++----------
>   include/crypto/tlscredsanon.h      | 12 --------
>   include/crypto/tlscredspsk.h       | 12 --------
>   include/crypto/tlscredsx509.h      | 10 -------
>   block/nbd.c                        |  6 ++--
>   blockdev-nbd.c                     |  6 ++--
>   chardev/char-socket.c              | 18 ++++--------
>   crypto/tls-cipher-suites.c         |  7 +++++
>   crypto/tlscreds.c                  | 12 ++++++++
>   crypto/tlscredsanon.c              |  2 ++
>   crypto/tlscredspsk.c               |  2 ++
>   crypto/tlscredsx509.c              |  1 +
>   crypto/tlssession.c                |  1 +
>   migration/tls.c                    |  6 +---
>   ui/vnc.c                           |  7 +++--
>   17 files changed, 101 insertions(+), 82 deletions(-)
> 

