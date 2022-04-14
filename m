Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A417500FE9
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Apr 2022 16:22:39 +0200 (CEST)
Received: from localhost ([::1]:57274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nf0Mo-0002a0-MV
	for lists+qemu-devel@lfdr.de; Thu, 14 Apr 2022 10:22:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nf0LV-0000ot-WC
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 10:21:18 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:40895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nf0LU-0002US-Dj
 for qemu-devel@nongnu.org; Thu, 14 Apr 2022 10:21:17 -0400
Received: by mail-ej1-x62f.google.com with SMTP id p15so10350762ejc.7
 for <qemu-devel@nongnu.org>; Thu, 14 Apr 2022 07:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=Q24TDEdb66p+PcxqjKcnLjZ+qQmnMhjSy0o9VRsKngE=;
 b=VhwlosiWqb4bq1geZ3GejX10xq5fBNtGgQ/OA1VLiSl0UZhqK6lGxWIrWjnBydAYJ0
 uD5ELsG4Q7l5KKjxBFRIrj4JaLqSLjJtvNc8On+hFEcWPqAymJ+z51gKVoUMAd7G+ymm
 IOg7VXDH0RLBxAdu0eU86k0VFVTic0zJZx0B7T3echiyQ7k8iwBq+JIvyxfwc5hWyZVh
 iWp405FlVAuJj1qoRDe+tVvu8fN0JtvJfRDfKy2th40F6UcTzeQORkZ3rHLP92gU9tQz
 sPGg5VIYJ0h4qwRuscze+C870QUa2TcNEBBCsTCDvBzUUcqTn7lQgw+G9QopmoMrawku
 LqUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=Q24TDEdb66p+PcxqjKcnLjZ+qQmnMhjSy0o9VRsKngE=;
 b=iz6L7muLWvbiw1ydEOpbb1LEDzt2oy9I1RzcJuupZoLsykjZ/MyXU9C892bgdl0fOb
 /MqwR7B/EKd50gF6BTeVrBEsArL/72V0YxH/mmbLzJCWP2pjgFdWS5pknH5bR5h6FnwR
 +Z5itCOxMFsSYMe+IgOhK6h8An3EEH3p6htt6SWIw8B2C26sij26KOMIxtbM5YNAoxUu
 PqbZ3H4z5/6/w1ECZES8ffnDjgWaMbI236ohzjivoR2I1f6f6RV4r4W6DH9OpOt86VTA
 7TJ3Ri07anpq0O3cJQmvE9Skg/v86VZ5C6I5pHANPMXOdkXH29pm0T4tYtia/zkjhCMS
 X08w==
X-Gm-Message-State: AOAM531VCcTl6xG8PDUccnw8RJuD+QnCDB0+8ecnLu+2H0PIsqVBPvqz
 hf+z478qMp/ZtfE+pfIbOF7GJ1f6WmhjLw==
X-Google-Smtp-Source: ABdhPJyJDzM0Vb4r6Hum5MVW09gpGoCUTfrIwPXIqDDh1wUezgtfihRDbazderbboUgwydApfIDRWw==
X-Received: by 2002:a17:906:3a55:b0:6ce:c2ee:3e10 with SMTP id
 a21-20020a1709063a5500b006cec2ee3e10mr2345838ejf.210.1649946074681; 
 Thu, 14 Apr 2022 07:21:14 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 ko11-20020a170907986b00b006e8811cc53esm668480ejc.137.2022.04.14.07.21.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 07:21:13 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 913D11FFB7;
 Thu, 14 Apr 2022 15:21:12 +0100 (BST)
References: <20220326132534.543738-1-richard.henderson@linaro.org>
 <20220326132534.543738-29-richard.henderson@linaro.org>
User-agent: mu4e 1.7.12; emacs 28.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 20/39] util/log: Drop call to setvbuf
Date: Thu, 14 Apr 2022 15:21:07 +0100
In-reply-to: <20220326132534.543738-29-richard.henderson@linaro.org>
Message-ID: <877d7rwxt3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> Now that the log buffer is flushed after every qemu_log_unlock,
> which includes every call to qemu_log, we do not need to force
> line buffering (or unbuffering for windows).  Block buffer the
> entire loggable unit.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

