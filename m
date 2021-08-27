Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C412E3F9B72
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 17:07:58 +0200 (CEST)
Received: from localhost ([::1]:57502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJdSN-0000V3-7j
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 11:07:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mJdRA-0007NL-7Y
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 11:06:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mJdR7-00030Z-6R
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 11:06:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630076787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aUkqubvLwIhUTrEDmb1151P1SS5DlqtmEoh5YsKUHI0=;
 b=LPGnUUrzq/aruITubN5XY7+qCzqQGMv1jcJuDTH0WycT8WQ45hdvUBP8MFPqqhXGDh62rI
 zG5XYftLtzXntw1QE92UpMRCKwwJZ/EvEwXc/Boe9K45Pw5iBbBF87dkgpV4aSYqg3VqTC
 5zON1d2Zf/6QpVNhu+kKZ/c7Q2wUnAs=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-118-5JpXPKNfNgedcNZtSAUmMA-1; Fri, 27 Aug 2021 11:06:25 -0400
X-MC-Unique: 5JpXPKNfNgedcNZtSAUmMA-1
Received: by mail-qk1-f197.google.com with SMTP id
 h186-20020a3785c3000000b00425f37f792aso388174qkd.22
 for <qemu-devel@nongnu.org>; Fri, 27 Aug 2021 08:06:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aUkqubvLwIhUTrEDmb1151P1SS5DlqtmEoh5YsKUHI0=;
 b=NVpoJDRXUpGTr7hJtz673dRKQEM4EPNYcwXVvcmK7O3lnAf6G29NGkfASHdKtOAfgc
 Ktypx7i6LQZ9rAvhmBBNhJxCuG3CQa9JETd+e+ubVtLgXe8f3SoVj1qoJ3GTIEui+8xw
 g8PAVCh0m/Q5GT+ka4GEO4DT5UfUWPvbcx7riKFoKbP5+udlk+oRbqBN9vYUlSwPtrBE
 JEOTZPDwbpBkfRncJbBbE/PawB3Ti5i7PS7HnNfDo31Q5ViRxQNs09CYuhenm2Pwo069
 vDcKGe2ehk/z6zz4NUvy5/6nSBPPOjE60cHmMbya9HrDEBaUwEWlsiDisdHo19QbPBTy
 88Dw==
X-Gm-Message-State: AOAM532qxDC3uhUXdsAduXzuDe6epsRCkGYN0kufpgfxq7lUxH011CND
 aBq+bbnZGw1RS1Rk8Ry6gNoEZj2y37OUwi1X74+od8AjGQaJSJ/WInH5NOi7qYDk9VNB2Tlmbe7
 6q3Z3QPmw/oD+m/4=
X-Received: by 2002:a05:620a:318e:: with SMTP id
 bi14mr9289470qkb.274.1630076784888; 
 Fri, 27 Aug 2021 08:06:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCYkSj+GAWf59ph8stllLvep/C6qktloGDccRjO/1GCn85kXXfZCdSBDQfyxNGit8nNp/MCQ==
X-Received: by 2002:a05:620a:318e:: with SMTP id
 bi14mr9289451qkb.274.1630076784696; 
 Fri, 27 Aug 2021 08:06:24 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::d413])
 by smtp.gmail.com with ESMTPSA id w19sm4963182qki.21.2021.08.27.08.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 08:06:24 -0700 (PDT)
Date: Fri, 27 Aug 2021 11:06:22 -0400
From: Peter Xu <peterx@redhat.com>
To: Song Gao <gaosong@loongson.cn>
Subject: Re: [PATCH v3 01/19] target/loongarch: Add README
Message-ID: <YSj/bsMX9RW5uXgm@t490s>
References: <1630048494-2143-1-git-send-email-gaosong@loongson.cn>
 <1630048494-2143-2-git-send-email-gaosong@loongson.cn>
MIME-Version: 1.0
In-Reply-To: <1630048494-2143-2-git-send-email-gaosong@loongson.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@gmail.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, maobibo@loongson.cn,
 f4bug@amsat.org, yangxiaojuan@loongson.cn, alistair.francis@wdc.com,
 pbonzini@redhat.com, alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 27, 2021 at 03:14:36PM +0800, Song Gao wrote:
> +The following versions of the LoongArch core are supported
> +    core: 3A5000
> +    https://github.com/loongson/LoongArch-Documentation/releases/download/LoongArch-Vol1-v3/LoongArch-Vol1-v1.00-EN.pdf

This link seems invalid now.

-- 
Peter Xu


