Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 557D5299490
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Oct 2020 18:57:34 +0100 (CET)
Received: from localhost ([::1]:54604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kX6kP-0004xt-BO
	for lists+qemu-devel@lfdr.de; Mon, 26 Oct 2020 13:57:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kX6Bh-0002wX-74
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 13:21:41 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:52043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kX6Bf-0000Us-Nt
 for qemu-devel@nongnu.org; Mon, 26 Oct 2020 13:21:40 -0400
Received: by mail-wm1-x342.google.com with SMTP id v5so12471852wmh.1
 for <qemu-devel@nongnu.org>; Mon, 26 Oct 2020 10:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=MN5XSL0Oco2LjEfDFO17M3TLIS3tkxXxZ1G7JnM38E8=;
 b=CbDA7d4c3fVUu8OfcGlGLb4RPyqRz3l2iy6ENDK7FOZuWs6uBDDOSG4d/16vwfRFiH
 g+GVbIYbB3OHX0eytHOEvQTJP4iag4ptLTTQdwYDphn6nX/yAR6YFwAkg2OvR0GBFszC
 mSvgdGW6aZ+PcaSftqAvGinGGs1+wDVily9O4WSro/2yq2g4Ai4OrADccb5nx0/pFgk2
 2oHG6oF0MwznOe0Rmm1VRpxXo1EiCoA9IaBv9PkccEDbqepzx8O/QlBzQmVWLRJdPdag
 pgx6sOgoz903WkallYQG5ZqmIRtcCPO+GclHFoH5NP2DJnAD0636wndp+oOEwsDjOvfT
 XYvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=MN5XSL0Oco2LjEfDFO17M3TLIS3tkxXxZ1G7JnM38E8=;
 b=bsmCdb2a1YO1fR48kllXAt7BwIglznlBf0ACpLmEj0BVwFnUHTpSmNtFZZtRvbhMx8
 bJ7WZQjNxr4krFig+FpaJQqATWEbOEgPlW/b8XacfBb4hYfAqxC/9S7ePnKHVLo6N4x/
 DoZG48xCZa6nySUXgjsU/L61Ho3QKMh/+Hss4T+BCiPz2Xr8M6JIxn/GlAsmLVXdir5P
 YkOfAfCEtXJL0YgwlQ2jHxlHr1u3Pb27Ii8DSktJMyUOpHwBmsV1tGK/O493NLqeknO7
 0CCol8EVtTKxJOoduE7NbfYkjfqkGnA/zWPanVkP4aKxID0zL70t7pvB23w14Xh1wsml
 n6NA==
X-Gm-Message-State: AOAM5301wJ/pF09CHysIHdeahlr95e7iM/kVd4sEAXqsW3m/h5Cbi1FJ
 W17uQ8asVMPHkEbXt4QQLwj7za97CHievA==
X-Google-Smtp-Source: ABdhPJzU6hjrITum3E369IzzYeZ/mpk598kftknPamF4r/ZZJtT/r5jjObRLFi1y8Jb8aUsdeUbutg==
X-Received: by 2002:a05:600c:608:: with SMTP id
 o8mr16870224wmm.86.1603732898213; 
 Mon, 26 Oct 2020 10:21:38 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z11sm22687132wrh.70.2020.10.26.10.21.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 10:21:37 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 60B491FF7E;
 Mon, 26 Oct 2020 17:21:36 +0000 (GMT)
References: <20201026143028.3034018-1-pbonzini@redhat.com>
 <20201026143028.3034018-11-pbonzini@redhat.com>
User-agent: mu4e 1.5.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 10/15] ppc: remove bios_name
In-reply-to: <20201026143028.3034018-11-pbonzini@redhat.com>
Date: Mon, 26 Oct 2020 17:21:36 +0000
Message-ID: <87o8kogaxr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: philmd@redhat.com, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Paolo Bonzini <pbonzini@redhat.com> writes:

> Cc: David Gibson <david@gibson.dropbear.id.au>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

