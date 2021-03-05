Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5F132F2F9
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 19:42:35 +0100 (CET)
Received: from localhost ([::1]:45678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIFPG-0000cR-7K
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 13:42:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lIEhK-0007Sk-4J
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:57:10 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:39964)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lIEhI-0003WC-Gj
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 12:57:09 -0500
Received: by mail-wm1-x32d.google.com with SMTP id o2so2201078wme.5
 for <qemu-devel@nongnu.org>; Fri, 05 Mar 2021 09:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=c1/YnZfEgEWaEvqgjanuPbGKVzLNa4nKZb6p5NmomF0=;
 b=GhO3pd22unOm6V5LsMVBzieLBtSqxMJl49sqEu+x7PgJ2RXWeS7znSn9Q4wpKHtQao
 sgEOPrQIWZx5m7QX2J9siOhEQT8ewfoYdkkoA6HAAlHn7ghlnFE3dCWA24iKfvxCi43G
 DGeWiLme+AKJ9WxNPxcOKPpLd6qhOuY8yESRh764e0nLnneodPcctCpsbbmfXgAqDsGe
 kQkjf+H0n7LleK49FkZkMERPu1OIgyGVNmafWSZ3dEnmMs5fl657iJLyiDWTdC92vww2
 GL1xdqJGUOStY2rdhPsMo2mEKarxUx/1030Pf6jFUO43Yk3i4psNQW+DbHzWq+tBUiq6
 rH6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=c1/YnZfEgEWaEvqgjanuPbGKVzLNa4nKZb6p5NmomF0=;
 b=DQFCUOmudl0TmP2xfFy8VXvmdzoQfJjtxn82L1p9XGSs6cyQUMUyiabTM/BZkU3t+0
 dPS9YKrML9vQi/PDM5xUzxwcrmbnPoQqFrjK8iySRQTFE3DBhYIOqhn6tFbV24/mdgQt
 bW4I8Jn+CnTjg2LZVw1G+aOCI8VxxRQPD+mKfv+OAjMQ3nWSDGS81E32m/TcAeZAVO4o
 KdHqWF9VhSPMpSAKjgKgNpsqTMmMlRhK5g553uZqBfbX7zplCfyCWsU30h72lI95DTNN
 /jCyyFVBuFMeU3tTR+QdxOe3nwC9OvHEwgKrsXiafA7XOsG00ZmjMrGuefBguIKc+gUd
 WcWw==
X-Gm-Message-State: AOAM5319jvy8QNNsVxuLIIX5WMl1L+igvKR6zUTjDZNceUY6FHsmGzCV
 3SdL4MdYek8LdUF2zr0EjXA+Gw==
X-Google-Smtp-Source: ABdhPJymIYgZf0dMU7cp/FIkhNy1hFUCU3V8iylgN0KcW11maoS2TmuFE8bcDS3IOFhp6di1vllzzQ==
X-Received: by 2002:a05:600c:4f55:: with SMTP id
 m21mr779815wmq.11.1614967027119; 
 Fri, 05 Mar 2021 09:57:07 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d29sm5423652wra.51.2021.03.05.09.57.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:57:06 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 324431FF90;
 Fri,  5 Mar 2021 17:51:25 +0000 (GMT)
References: <20210302175741.1079851-1-richard.henderson@linaro.org>
 <20210302175741.1079851-16-richard.henderson@linaro.org>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 15/27] tcg/tci: Remove tci_read_r16s
Date: Fri, 05 Mar 2021 17:51:20 +0000
In-reply-to: <20210302175741.1079851-16-richard.henderson@linaro.org>
Message-ID: <874khpebfm.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
Cc: qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Use explicit casts for ext16s opcodes.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

