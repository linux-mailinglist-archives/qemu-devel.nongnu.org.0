Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D1E4D852A
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 13:43:55 +0100 (CET)
Received: from localhost ([::1]:46080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTk3G-0004c0-Db
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 08:43:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nTk1D-0003nB-K4
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 08:41:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nTk1A-00084m-SH
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 08:41:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647261700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XV08VuWR39lb8P+ZPKMnq2DqMFK/TBQUukFMupwTY0A=;
 b=RQg05U6NUYKDhgWQtQYUFX4+f7UnSgknSGVt7nzLMvfHFSAgnufM7NgRqatL9LsgHQqOB5
 aVN5UbtuB1cKLcerrwbUY3b+ZfG/8sRUJHck1WL29y/NKBboOct+f3B7SCmWbx2NfjX6LG
 63sp4DUeQq63222jqs+I5NpokUhJc4I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-187-sT8KTf4gP3isOpwIlnV-0A-1; Mon, 14 Mar 2022 08:41:39 -0400
X-MC-Unique: sT8KTf4gP3isOpwIlnV-0A-1
Received: by mail-wm1-f69.google.com with SMTP id
 n62-20020a1ca441000000b0038124c99ebcso5656084wme.9
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 05:41:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:cc:from:in-reply-to
 :content-transfer-encoding;
 bh=XV08VuWR39lb8P+ZPKMnq2DqMFK/TBQUukFMupwTY0A=;
 b=Y/iSrwFLG769cNHvAKvJZOgei8ftl46nhYkffNdsL5T2wz0idPAyIWHkqvvX0PVYSV
 YyTlBcoh58E3WCJeFtrc1jDBnmZTMftTfNlsu3xo4fPxseCE8P07//qDfgsU/eWmWU2o
 O1iYo3LoYo5irKo1XUiptdzg6MZpmS9iUWu8WUsFKtBCxOdiwfgBceEYc5xWXyX0dy5d
 3eJGAJH0LBUKeY1U/WwzLLwiXezMwVir+/EKwxIvSyRYEGFeBZUwbpJjPCIoCyrgvunZ
 8BOCg5O0SzJHcaMukrHxke8Gd3ABa3QazTcooUCObD8BPg7OrpQhSqu6yH/TuItJWm4B
 NtAw==
X-Gm-Message-State: AOAM531HiJ0LIL8RjPuEANDlQKtxu4hR7Lpp1Bd1lJ/Q5muWVuNencCo
 EAhdl5ceFpkfcXSfXaDLVpXfJnqqgG/HpNLvhZn1814I8RfS71dHSEOsU99zjPslMCVlfhsT2Be
 DtstihPghjBSE71w=
X-Received: by 2002:adf:ee4b:0:b0:1f6:3413:282b with SMTP id
 w11-20020adfee4b000000b001f63413282bmr16479425wro.354.1647261698536; 
 Mon, 14 Mar 2022 05:41:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypOx58yZA+oxltUsEi0Q65d1AgusaNSXcyrzuqbHcbH6VG2nzpoSqfTQT3Q40SpzJ3Nw+oWw==
X-Received: by 2002:adf:ee4b:0:b0:1f6:3413:282b with SMTP id
 w11-20020adfee4b000000b001f63413282bmr16479414wro.354.1647261698309; 
 Mon, 14 Mar 2022 05:41:38 -0700 (PDT)
Received: from [192.168.42.76] (tmo-099-109.customers.d1-online.com.
 [80.187.99.109]) by smtp.gmail.com with ESMTPSA id
 l12-20020a05600012cc00b001f059bcbd7asm12950590wrx.31.2022.03.14.05.41.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Mar 2022 05:41:37 -0700 (PDT)
Message-ID: <74689a0a-6b7c-6797-f701-5e122f68e418@redhat.com>
Date: Mon, 14 Mar 2022 13:41:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH 0/3] tcg/s390x vector fixes
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20220310202751.594961-1-richard.henderson@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220310202751.594961-1-richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-s390x <qemu-s390x@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/03/2022 21.27, Richard Henderson wrote:
> These 3 issues were found by running risu on arm neon test cases.
> In the meantime, Thomas encountered one of the same with the new
> tests of vectorized sha512.

Thanks! If you don't mind (e.g. if you don't have any other TCG patches 
pending), I can take these through my s390x-next tree (I'm planning another 
pull request before the rc0 hard freeze tomorrow):

  https://gitlab.com/thuth/qemu/-/commits/s390x-next/

  Thomas


