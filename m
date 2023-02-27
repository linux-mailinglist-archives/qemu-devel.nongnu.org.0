Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2932A6A3E6F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 10:33:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWZsc-00075q-Ix; Mon, 27 Feb 2023 04:33:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1pWZsa-0006un-77
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 04:33:08 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1pWZsY-0007BD-80
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 04:33:07 -0500
Received: by mail-ed1-x532.google.com with SMTP id o15so20523715edr.13
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 01:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8oYTFB2bJVBpIOOr17q869UnrDe7yXBRgFS4jPUkYZ0=;
 b=j/mlljhWCV5f4mbkTF3sSemAXxrqW0d/QkPcIjBr+EIBXgVSjKlEPlV9hsWR7lDtfg
 zOg2bIT6ie7g7DVg/YMvICA2p1P5srKJewyAUnpKVPT5/goBEyOuUOTgYJ9YRqg9DzKw
 DRRqirEKUHbVucvWGad/Ctke0dH4ijcKUp1TP357LV6YMOhSb4uXPdxl7EEdg3FDKK50
 MULxxJnjHx0o+rtRt2JrwtSsFVkL+T4Vr4d6wgwfwPlE2uTCMRyLVEpT0bHmCP22S02I
 9qY3YPnCXMCcFmbCf6oK+y8/I37H2hZhdF4irp0cQxpI+QDphH7W+Lu2rzTbWSuJTcxG
 Y66g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8oYTFB2bJVBpIOOr17q869UnrDe7yXBRgFS4jPUkYZ0=;
 b=h/0HSSvjfcURiFjTBOfJC6kJfe8IyPXqnc6Ecnjvk7Q4gGV9NCVqvNcbSoMxAcLNID
 9RgIX2XtGge6YebtQdJvFLlh3YDXipOppXoergQf6sBE2y6gm4MOcx8/pgGbVC+fgiYV
 MiFJJ82E+XQpr5z5WX72IhBUX94eByzsiliokoT/wfj2dbRj0skYOc0IR04ZTZDd/dx+
 LWGu/EHskEB1OEDzHStwnPzi3+U3u0StceWiPEfjXtAmS2a5gOC1kwYGK8u7m6qvb70N
 uxK8IdX+yBRRjU2i1vJt7BKFee08nk1KTkwiRVw3SKp4FKsMiwTIVdNbWHcrWwDeu/C4
 Cw5w==
X-Gm-Message-State: AO0yUKWow0flxH5FEZqrhpxOvIsNirj8gvvGILlG95IFFNnJboAFxDx1
 IbjgW293DS2A+mynDUYm+hgKa+EsxosOSiiP9BKrGQ==
X-Google-Smtp-Source: AK7set9Ar84lqSxb4+NN2KE8d4nkIjRuLXQks7Ws+oC5oHAG6UcHChfe/ohqsBOZF5gKJVdCdpVIy0As2wneIKfj1UM=
X-Received: by 2002:a17:906:48c9:b0:878:4a24:1a5c with SMTP id
 d9-20020a17090648c900b008784a241a5cmr14836087ejt.6.1677490383152; Mon, 27 Feb
 2023 01:33:03 -0800 (PST)
MIME-Version: 1.0
References: <20230227090228.17117-1-ivan.klokov@syntacore.com>
In-Reply-To: <20230227090228.17117-1-ivan.klokov@syntacore.com>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Mon, 27 Feb 2023 10:32:51 +0100
Message-ID: <CAAeLtUCXroEK8aHCsTung81cvozFuHdZWte0JnNyRw7Wu39Azw@mail.gmail.com>
Subject: Re: [PATCH] Fix slli_uw decoding
To: Ivan Klokov <ivan.klokov@syntacore.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, Alistair.Francis@wdc.com, 
 palmer@dabbelt.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 27 Feb 2023 at 10:04, Ivan Klokov <ivan.klokov@syntacore.com> wrote:
>
> The decoding of the slli_uw currently contains decoding
> error: shamt part of opcode has six bits, not five.
>
> Fixes 3de1fb71("target/riscv: update disas.c for xnor/orn/andn and slli.uw")
>
> Signed-off-by: Ivan Klokov <ivan.klokov@syntacore.com>

Reviewed-by: Philipp Tomsich <philipp.tomsich@vrull.eu>

