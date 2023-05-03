Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9309C6F548D
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:23:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8h0-0008QS-5s; Wed, 03 May 2023 05:22:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pu8gq-0008Dc-ED
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:22:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pu8gp-000646-0D
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:22:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683105742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NqkgC3S1KDc2BY6sHeEgA68VO8be0MAPKfmv5U/1kJc=;
 b=cNqZM83wLQx9CPHgiW8gnitFagZMACNdJGkJvEOiAT+S1VWBh/93S7bJ0gNVwTwKTD1cHI
 Lg6/IhOSEPa2pjstq0MzmlIYvtRlpzxLcNYVlP5rUL6zIEUWzE6SkyZFJrPm3g9N3ZxV64
 cIlnC59UxpDH9kfwR0VtqzbxTXGeeV8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-141-ZPJmwnOHOVO80x2WMuXunw-1; Wed, 03 May 2023 05:22:20 -0400
X-MC-Unique: ZPJmwnOHOVO80x2WMuXunw-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3063287f1c9so896328f8f.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 02:22:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683105740; x=1685697740;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NqkgC3S1KDc2BY6sHeEgA68VO8be0MAPKfmv5U/1kJc=;
 b=K/s2FJYgLVMHLD57kqVUfm5WN9oellATXH+uGS7FLoZ1GPLrXdasaV4OP8ohBV9aUF
 NSa1T0HeESxGmIrujaiwJS9JyqTPnmqStTs5yKZx3sXHhTabUy+jDwtkuDDRGDP4m9fW
 y4HRXLSxpzzHCBvpA8ycFkgHmtoEJ1dJ+B190DPNPFamCerrIIxPvGpy/6sptw/h1tqi
 ibJY6VeEmHtPTsJifAwG1j75o58NPjFojhyMDpF1R5DL3/eMCz8wicJAP8NOn+3lUlTL
 HRD4inbZ7EmEurkqzzAufVE8smcZcoxXchXf4z3rQLiKICLan4KQpAwTp4Jq8aAkVbtE
 Xy4w==
X-Gm-Message-State: AC+VfDwlfdsQgTQiW+v1hbsR0cM1JlhwpFJcrEQUOSoK3ePL3p9g+AtO
 VkjUlLFZEIm40/KX3oAy1ydHHuPZ2i0UH7ltZCXyTz5q1APTiPLVxHRpvnH1iHdka6FNkiwk6X/
 l4Pk7W/I9MpNU81c=
X-Received: by 2002:a5d:5956:0:b0:304:b1da:77d with SMTP id
 e22-20020a5d5956000000b00304b1da077dmr13732789wri.52.1683105739753; 
 Wed, 03 May 2023 02:22:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4zkgTg0hNU90IWfatI+wAuApnaC8+mWHzlSSnDZTajjrQ2Bn0JF+c0RLqYxuYEsLnrBaJkVw==
X-Received: by 2002:a5d:5956:0:b0:304:b1da:77d with SMTP id
 e22-20020a5d5956000000b00304b1da077dmr13732762wri.52.1683105739498; 
 Wed, 03 May 2023 02:22:19 -0700 (PDT)
Received: from [10.33.192.225] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 j14-20020adfea4e000000b002fc3d8c134bsm33386891wrn.74.2023.05.03.02.22.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 02:22:19 -0700 (PDT)
Message-ID: <ddafd03d-3109-2bc2-4f91-1d8e5b1fe6a5@redhat.com>
Date: Wed, 3 May 2023 11:22:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 04/22] scripts/ci: add gitlab-runner to kvm group
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Helge Deller <deller@gmx.de>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 John Snow <jsnow@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Andrew Jeffery
 <andrew@aj.id.au>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Beraldo Leal <bleal@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Radoslaw Biernacki
 <rad@semihalf.com>, Aurelien Jarno <aurelien@aurel32.net>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Song Gao <gaosong@loongson.cn>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-5-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230503091244.1450613-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 03/05/2023 11.12, Alex Bennée wrote:
> One of the main reasons to have custom runners it so we can run KVM
> tests. Enable the "kvm" additional group so we can access the feature
> on the kernel.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   scripts/ci/setup/gitlab-runner.yml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/ci/setup/gitlab-runner.yml b/scripts/ci/setup/gitlab-runner.yml
> index 1a1b270ff2..7bdafab511 100644
> --- a/scripts/ci/setup/gitlab-runner.yml
> +++ b/scripts/ci/setup/gitlab-runner.yml
> @@ -26,6 +26,7 @@
>         user:
>           user: gitlab-runner
>           group: gitlab-runner
> +        groups: kvm
>           comment: GitLab Runner
>           home: /home/gitlab-runner
>           shell: /bin/bash

Reviewed-by: Thomas Huth <thuth@redhat.com>


