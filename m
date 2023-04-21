Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5F06EA3DB
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 08:31:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppkIT-0005WI-VY; Fri, 21 Apr 2023 02:31:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppkI3-0005I6-Ce
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 02:30:42 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppkI0-000485-TM
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 02:30:38 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f191c1a8a7so2091715e9.1
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 23:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682058635; x=1684650635;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BUjIV7o6S9/PMYs00On6yDjTPHeRIfKV+LO6rS10PbA=;
 b=Dl65Qzs10seGd7DCd2mi9TlVPrDKrOjQIKpw57BvlZtm01w/DlMAOBae9I6AcqhFnc
 CpEkcDC8tWDh/YCg0vRNm8BnTdQuxsCwq4Y4IjmukDsdJ5paJ5GFSgvpuRMgtzW0Ubxa
 YFuGmtqfPygeMVkaiY4lrqxFjijF+2769t125a7F6ExpG30F1Wsiy6iZGrtOafWlFn3P
 xjffOx4lVhMBeNJZIG8LlPIitdlDHYOQdZzCUtpgFd5BqCzWtYJrUKEuxmX6llRcklHc
 Zy4/LCXXWiEYU6HzNNAwAl/PiLdqP1DX82YMOFogWcUWiXJnLvbxnAecXS2r8xV0Ngp2
 uygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682058635; x=1684650635;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BUjIV7o6S9/PMYs00On6yDjTPHeRIfKV+LO6rS10PbA=;
 b=PTSuR+v5DYlU963wwqfviQIA4DOZGvzPXhRYi8XbNlSpYyWVykpOKaDersA13kKXQ8
 OTWjWnjWqLPlq/RRIiiGOniV1urbENKHopuuMq5PrAq8RnPCSjMha3lJNn4hX+OtnIRK
 FDQupQaO2LlDt1wwUSn+G/9ojwFA0Inw10pfvwqehwnuEdeHGRuM1Ns/WDgmqxPCRGh7
 /d6X+KfLx+/9tg4F87DlARNbH6it9jdiuQV5fqNW67+RQgccri0WZ3VXziam0ZTyJgxJ
 4dH/sm1B31ldF0cdFrYtrVdd7IzYcmBIXivnTtNycMHUDG2fkR7xH2zPQ70B4+J+OwN/
 D6og==
X-Gm-Message-State: AAQBX9eFKJuHUJwnlPwtHJxYY4tGVG+1bWSu6Ws5KYbu2ACMK0voVVTZ
 QjAOUcXUtwuLslchy6FF384vmPk3ke1fIUXp446PyA==
X-Google-Smtp-Source: AKy350Z1bBc1faddtCi/ubxrKba5hQGfa3vrjf165bbF3CiWNj5Ndg7RBJKRu8dltKNRUxBjvXz5Ig==
X-Received: by 2002:a7b:c393:0:b0:3f1:6458:99a7 with SMTP id
 s19-20020a7bc393000000b003f1645899a7mr898059wmj.38.1682058634804; 
 Thu, 20 Apr 2023 23:30:34 -0700 (PDT)
Received: from [192.168.69.115] (min31-h02-176-184-28-119.dsl.sta.abo.bbox.fr.
 [176.184.28.119]) by smtp.gmail.com with ESMTPSA id
 k3-20020a7bc403000000b003f1745c7df3sm3944800wmi.23.2023.04.20.23.30.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 23:30:34 -0700 (PDT)
Message-ID: <e428d658-d30c-cc80-0f2a-29e7dbd82a95@linaro.org>
Date: Fri, 21 Apr 2023 08:30:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2] spice: move client_migrate_info command to ui/
Content-Language: en-US
To: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20230420123711.26640-1-quintela@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230420123711.26640-1-quintela@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.669,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 20/4/23 14:37, Juan Quintela wrote:
> It has nothing to do with migration, except for the "migrate" in the
> name of the command.  Move it with the rest of the ui commands.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>
> 
> ---
> 
> I would claim that it should be only compiled with CONFIG_SPICE, but
> I left that to spice maintainers.
> 
> Gerd, what do you think?
> Should I take this patch over my tree?
> 
> Based-on: Message-Id: <20230420121038.25167-1-quintela@redhat.com>
> [PATCH v3] migration: move migration_global_dump() to migration-hmp-cmds.c
> 
> ---
>   qapi/migration.json            | 28 ----------------------------
>   qapi/ui.json                   | 28 ++++++++++++++++++++++++++++
>   migration/migration-hmp-cmds.c | 18 ------------------
>   migration/migration.c          | 30 ------------------------------
>   ui/ui-hmp-cmds.c               | 17 +++++++++++++++++
>   ui/ui-qmp-cmds.c               | 29 +++++++++++++++++++++++++++++
>   6 files changed, 74 insertions(+), 76 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


