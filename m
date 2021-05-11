Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BFD37A847
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 15:58:12 +0200 (CEST)
Received: from localhost ([::1]:47548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgStn-0006hY-CN
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 09:58:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgSrU-0003uI-T6
 for qemu-devel@nongnu.org; Tue, 11 May 2021 09:55:52 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:40534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lgSrR-00013j-Nv
 for qemu-devel@nongnu.org; Tue, 11 May 2021 09:55:48 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 y124-20020a1c32820000b029010c93864955so387635wmy.5
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 06:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=lAHlXdICkT4vYr7qD2PWSaCVuqcClSIge/QJ9pCTg3RG4YSssRfoQvjU/iVdsnqFRO
 TSxPa3rWmTB+4o9PtQzZyRfBDaUxoRYdMcnh9Q+ZnTqdXlaw35OpBo+wzGWvFaAuItd8
 jmRKaMaT3JX4ShyzTNzbQ1lx+5UIhm3DUOUqnCBD5SINsx44RYr5NuCLQy8fzw6cFI8E
 azw7K7cBwwP6vAmvKn7Qq0CXYrS4sCUPVKP13vji9FAV6WTsztoBmsJUcy+1yzbwmYr7
 LzgpZ8QJetAkOOHRdcQe1ZHk7OfTYxNMj0IHiU0uv3XKBzG7gGshv1IjebUqT5ssZ8rZ
 pArg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=PhuciOTxGzyt42NozTpQG7KL1ETjDSYk2QrBi6IxQio=;
 b=gNmmXDXuVLERRpNcJImTn93sYd+9zf+c+FcjpZsN2OHJAYh8gjhyf6flBdvKZVCsB6
 rW25KFzitzfGVqPc43UtZD49bOWxt2i2NAjfdOQRQD21TthiXbbqkGkH/NFt3hgyCLEH
 Ja9+hLmnR6fUI5b/5dVl6EOzly/k8D2xjh3vaQaj/B5esg6j9uhPDd33eoanQf4CZut3
 CJAjMWtyd6Cqvz1w7njK6+8snanuZLVyVj88XP6QMDc9vfxazCqdp3MmieN3G8FGtahI
 timaGA2usSQ/Ypg2u14yXU8ZqcRmRrmeYaMrv/K4L5mRe4pVJiaUHmYQ5Nyh8TAhk1sF
 C+TA==
X-Gm-Message-State: AOAM530HVB1gj6YLjqNvpcdgZzknuSuen4sTWCKalJly82emIvAO5fR1
 maAkZh/g7sfeHPiQetLhLdQi1g==
X-Google-Smtp-Source: ABdhPJymdyQOQhkYjV37DN0pYqH4a4B1ZQNK8vlzkpCOIuYXGl1DFu+HQG08Do5cT7/dmWFt0WvOTw==
X-Received: by 2002:a05:600c:1907:: with SMTP id
 j7mr32285116wmq.158.1620741344270; 
 Tue, 11 May 2021 06:55:44 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y17sm30851703wrw.90.2021.05.11.06.55.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 06:55:43 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 91DBE1FF7E;
 Tue, 11 May 2021 14:55:42 +0100 (BST)
References: <20210508014802.892561-1-richard.henderson@linaro.org>
 <20210508014802.892561-24-richard.henderson@linaro.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 23/72] softfloat: Use pointers with
 ftype_round_pack_canonical
Date: Tue, 11 May 2021 14:55:38 +0100
In-reply-to: <20210508014802.892561-24-richard.henderson@linaro.org>
Message-ID: <87fsytgysh.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
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

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

