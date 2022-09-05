Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E27F5AD630
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 17:21:43 +0200 (CEST)
Received: from localhost ([::1]:55186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVDuw-0004fn-NV
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 11:21:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oVDt4-0003Id-8u
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 11:19:46 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:39693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oVDt2-000894-Hi
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 11:19:45 -0400
Received: by mail-ej1-x634.google.com with SMTP id fy31so17734043ejc.6
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 08:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date;
 bh=oZRQhnDWq+lOCaaouPOsbXMpa6fkXD94VF/enfM6/nY=;
 b=HbXH4ZKoA9iVUlxUWVIzmCXk3dICU7uKEDTAhTmmICguLpfTV+ERhLgwTy3D8FSTLt
 zAWIeHCTNN/jW924rCzIivIiRzULnsjnj5N4SQJKdQ+fVjdN4K6bZJObRHpnCTjhZc6I
 9UAvP99Tu4XXuGHKOwNkoz6VYDiBsdLqHzjTNzHP9FnjSUP9H03/v92us7N3ktL0KOqN
 ishR1XlUYxob4AzxwsoaZs5tPIEalqJuxGzTGCe+wFHoIxKWO4B5ypb0NPGGp3n/LYLm
 QQGsoQwfwwD16spEPTEEGgmm94Qk/53H6ci0a1Zm66jOdubU7hLdMdCmv8O1PQ0uChoZ
 Cuvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date;
 bh=oZRQhnDWq+lOCaaouPOsbXMpa6fkXD94VF/enfM6/nY=;
 b=XXcvUvmf0ccx2dXRw73hK1WYcdzovtIAEjEJeUkyivKtBgVvvUWJPmQwT5Q12ey+w3
 adJtNCFxy06Hn8o292MBvrSl1oyUiYNailWzt+MTQ2Yefz7LlqjoYrcDwOk6HT+phGRa
 Z02XILJvoVpX7kA14eWz44LGEbLcVgBXAu0GQ6TYuE1xwLMMZxNi41UUvTod1EP4oLMW
 DmAy4j0Oe1lP7XRVMLkP+Kqyn0OM7qcKpsIYQDLGX4TGPFAQUghOiZmMuTZpXy3fM9Kj
 ijEPmOia67EpnjWmrwwYMOUK2HrjNQHmHxnx3kaOjr2ZQv8vVlyC0pjuhRejDfHH/cNe
 VUNw==
X-Gm-Message-State: ACgBeo3ycmtTmIRszHQlEotDDTT1CcX7ySY7UIM8fbSODljtornhKMZW
 03wnG8gFapSWYOo+guepJhRf6Ymbo3PT5Q==
X-Google-Smtp-Source: AA6agR7A3nCIi6bPASi9nTcGAtvG5GXZxq+fcV/RA5hCj9XcaBrpuA8q4qMFFeBH9wgWRlfgQgujKg==
X-Received: by 2002:a17:906:9756:b0:741:5fa3:884e with SMTP id
 o22-20020a170906975600b007415fa3884emr28011296ejy.515.1662391181948; 
 Mon, 05 Sep 2022 08:19:41 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bd13-20020a056402206d00b0044e66ee9b62sm3084032edb.42.2022.09.05.08.19.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 08:19:41 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0360F1FFB7;
 Mon,  5 Sep 2022 16:19:41 +0100 (BST)
References: <20220905111038.33324-1-pbonzini@redhat.com>
User-agent: mu4e 1.9.0; emacs 28.1.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: armbru@redhat.com, qemu-devel@nongnu.org
Subject: Re: [PATCH] tests: unit: add NULL-pointer check
Date: Mon, 05 Sep 2022 16:19:36 +0100
In-reply-to: <20220905111038.33324-1-pbonzini@redhat.com>
Message-ID: <87zgfdkfw3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x634.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Paolo Bonzini <pbonzini@redhat.com> writes:

> In CID 1432593, Coverity complains that the result of qdict_crumple()
> might leak if it is not a dictionary.  This is not a practical concern
> since the test would fail immediately with a NULL pointer dereference
> in qdict_size().
>
> However, it is not nice to depend on qdict_size() crashing, so add an
> explicit assertion that that the crumpled object was indeed a dictionary.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

