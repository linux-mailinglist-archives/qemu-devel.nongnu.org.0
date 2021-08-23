Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F793F508D
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 20:44:03 +0200 (CEST)
Received: from localhost ([::1]:35838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIEvR-0000Sg-Np
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 14:44:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mIEtP-0007RA-M7
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 14:41:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mIEtL-0003dr-9E
 for qemu-devel@nongnu.org; Mon, 23 Aug 2021 14:41:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629744109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JLy+BP5QfRHQcgnmyyQgp0hJb6D1s0VN6etpqjPgKaQ=;
 b=GfNUPGnfu2IrMf8DUguKll5zvaEF/Rz2pbamzstQFbtidmqWmcqj+WeLDIt953etQTlr+n
 ldfwNO6T9jiY8/MLH3wRaKChaixotY1E5GUdaToQ40CYU2vVRtuumDsLSI9fFWijLNVtRF
 X3daoPhTJ7JwYLCk820hQJBRCY0lkWA=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-95rxzyubO1mRc4JUOP1bgQ-1; Mon, 23 Aug 2021 14:41:48 -0400
X-MC-Unique: 95rxzyubO1mRc4JUOP1bgQ-1
Received: by mail-qt1-f198.google.com with SMTP id
 x11-20020ac86b4b000000b00299d7592d31so9115612qts.0
 for <qemu-devel@nongnu.org>; Mon, 23 Aug 2021 11:41:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=JLy+BP5QfRHQcgnmyyQgp0hJb6D1s0VN6etpqjPgKaQ=;
 b=MGGfnftR7ZXrzmYftXKhO2lKYXSXm65ZBr0t5ZBkhywjxVNE8y0w21KLMyntIRq4PQ
 eLI0iyqhHpOnTw53mtM8IiL82msKgWGtZKaj/113JG0bqiUAshxXvHGQLaZ3PbvwYxMs
 17THdMf1jMIzGehjE8cdwRFYr9n1uOZVdeE1rDmQayN7jLSbwmKV22IgBzOpF/qhJF1l
 /zO5Cx/rGeL8zII2+XQN+82ypHaLozUKp5yOOZtvN7WNsYA/mKLG4Yvq/l0Fbaor0vB/
 pg8qasjVnVIy8LQgRcqfg1WvSXOF6Sc1d9sT3kPDDuXNwY4XwPSjcTbHrQtqQOKdSo3a
 hPww==
X-Gm-Message-State: AOAM530GDo0SF7wIwiVBPYZUF0o1/jae4Zz9vQkLDzqcJXSzJZc1XOQT
 OQ1skq+zu6jtcbssEbTrAwQQtdEDYBnr8lwZM11VCnsangcgMdFG8MumWpBLbQ+s8ioOLutHt7H
 DelDrGqbAAbur4n4=
X-Received: by 2002:ac8:7d0d:: with SMTP id g13mr8420684qtb.367.1629744107686; 
 Mon, 23 Aug 2021 11:41:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCBq0ga1EUoBCiF9P6VOhBbQZXJTvdcruWNtm300nSBGC6rjh8SXcBaz8e/UWHi+rNjSJDNA==
X-Received: by 2002:ac8:7d0d:: with SMTP id g13mr8420647qtb.367.1629744107400; 
 Mon, 23 Aug 2021 11:41:47 -0700 (PDT)
Received: from t490s ([2607:fea8:56a3:500::d413])
 by smtp.gmail.com with ESMTPSA id 207sm9467761qkh.45.2021.08.23.11.41.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 11:41:46 -0700 (PDT)
Date: Mon, 23 Aug 2021 14:41:45 -0400
From: Peter Xu <peterx@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH v2 3/5] exec/memattrs: Introduce MemTxAttrs::bus_perm
 field
Message-ID: <YSPr6dN+iKKFlCxy@t490s>
References: <20210823164157.751807-1-philmd@redhat.com>
 <20210823164157.751807-4-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210823164157.751807-4-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, qemu-devel@nongnu.org,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 23, 2021 at 06:41:55PM +0200, Philippe Mathieu-Daudé wrote:
> +/* Permission to restrict bus memory accesses. See MemTxAttrs::bus_perm */
> +enum {
> +    MEMTXPERM_UNSPECIFIED   = 0,
> +    MEMTXPERM_UNRESTRICTED  = 1,
> +    MEMTXPERM_RAM_DEVICE    = 2,
> +};

Is there a difference between UNSPECIFIED and UNRESTRICTED?

If no, should we merge them?

-- 
Peter Xu


