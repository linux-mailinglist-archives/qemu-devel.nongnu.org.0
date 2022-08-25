Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D895A0968
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 09:02:25 +0200 (CEST)
Received: from localhost ([::1]:54256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oR6si-0003iW-Eh
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 03:02:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oR6gZ-0003uS-VX
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 02:49:52 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:38497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oR6gY-0001Bk-FP
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 02:49:51 -0400
Received: by mail-wr1-x436.google.com with SMTP id b5so19056071wrr.5
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 23:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=BdFWCelkVolwjZbunA0ZjkwCGCQVLWgywbY7hiQNUvM=;
 b=XP1wBh3H5v54ozlwuYfKnLfD3koutGUr+Vm9cE/mNH44FbY5l3+fKSHQpuQA8WCjxz
 3GOaZGqMGkrpYyDlNcIvwiMqds5rqIe6MnD/3ZKIgVLzw4Eq7D4mx1aIwnOKQQI7Txe0
 I95Vz6xNuoz8UB55txYHDfz9uT4ZebznBlh5hUgoZ1blI9DiXe/au4o6MQPMdKAqn+KF
 3OimUgFamK1C1YPAmP1AhDp72xlxdsIOI3pQ2ucRVU068LJrNfzL3Ft31U2ikCSLVU66
 erKmITLOmSakw2ueYlaW3YIe/cHLTkM6eoBydBo+ao3mXl7HorP3hHukkK9XBXGX3D/w
 MUWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=BdFWCelkVolwjZbunA0ZjkwCGCQVLWgywbY7hiQNUvM=;
 b=hkkxDRL6iCCWhyoRuIeS0SzlDNrwDw88FXLdP0wnIzV+Rg0LxXJFyPRISGrRvkzF05
 e91UcS0/Uh8WTxXB8xLn3QqvXVRvgcdqPdY76seHgUYb/YcJ0k0kJ14m7ZlniLLVrNmW
 1FmVAwBGPbV9SZ0OnNH0Y2BsOhBdweouhP/lnKhEZBnHXfgyEQKel5rHJnzJ5OI63d5M
 s/96gM9LTNOl91Q8q+g0FE0y8DVYY9cyl0Vhg3fPfOK+aVNwimge9q3Q+loTqL2Mj4UA
 oGETJeKFRKsZTJUhSuV9tznmVljm3j9QfoLtrboMEQxbJ5gad7iuS8xvkatl0qZstbBR
 yLZw==
X-Gm-Message-State: ACgBeo2wYJxXiSsZ/MZhaPGRRtR+Xu/R5/VFGb3A/cN9PKOGHjvP0UdU
 XGZvtA5kD85He2+i8m67YWQECdAtv/M=
X-Google-Smtp-Source: AA6agR5DG5LMqAzmBwEDI+l/AE+xTAcx87dtkhcTPu4SrypLMt8fRKHKyU8xZH5z6bLCaq46shsYYw==
X-Received: by 2002:adf:e4ca:0:b0:225:3389:6092 with SMTP id
 v10-20020adfe4ca000000b0022533896092mr1266884wrm.314.1661410188961; 
 Wed, 24 Aug 2022 23:49:48 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 o18-20020a05600c511200b003a5dde32e4bsm4379786wms.37.2022.08.24.23.49.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 23:49:48 -0700 (PDT)
Message-ID: <5a8994c8-b013-7dd2-50ef-932371ec8dab@redhat.com>
Date: Thu, 25 Aug 2022 08:49:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 05/17] target/i386: add 00-07, 10-17 opcodes
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: paul@nowt.org
References: <20220824173123.232018-1-pbonzini@redhat.com>
 <20220824173123.232018-6-pbonzini@redhat.com>
 <f1114bbe-4f66-f4ae-068b-8813deb9a254@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <f1114bbe-4f66-f4ae-068b-8813deb9a254@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 8/25/22 02:27, Richard Henderson wrote:
> If you were sharing this with the old decoder, and thus needed to retain 
> it, that would be one thing.  But there's no shared prefix or postfix in 
> this function, so you might as well split each case into the functions.

Yes, absolutely.

Paolo

