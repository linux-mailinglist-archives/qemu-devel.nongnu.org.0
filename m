Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1B430E164
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 18:49:00 +0100 (CET)
Received: from localhost ([::1]:41990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7MGx-0007OR-QV
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 12:48:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7MAB-0008Qk-9S
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:41:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7MA9-000785-Nt
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 12:41:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612374116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dYrpdgSQCzfcKgd/MDJtx+VULKbgcv39ooZaRZ2cqOA=;
 b=jHR4XQhrzlnFH7IWMc6YRtKr8OOuAQ4IL4qklodJqHnO2NfyxakVDUHhleHFtLoeAQ+e3/
 RG7BteDqscTx7+0jeOGYk1D2IQYQvBUjZv1blVdj2Mf/a6GZRJoG5K8o0KA5bN86Le2B5O
 /RJ/BhlbdFPz3PbfmzW38s54n48E1yA=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-yWcEmZ5XM6-wViwKCG4nCg-1; Wed, 03 Feb 2021 12:41:52 -0500
X-MC-Unique: yWcEmZ5XM6-wViwKCG4nCg-1
Received: by mail-ej1-f72.google.com with SMTP id ar27so136714ejc.22
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 09:41:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dYrpdgSQCzfcKgd/MDJtx+VULKbgcv39ooZaRZ2cqOA=;
 b=qJ5TrW587IccTUkZZ+QoikcQBNT49g+pvmKixWPmnjlRkTU1rGVdRXf0hJDZQEGNaV
 4BI3sexXWiCN1nVFOEGodn7e5HIvyKOSg+uUncNT2M9xAuMqlGsqtU+0OnIWT85CUO3R
 /UOIDnFLre6GN3J7A3uTZSO5rW33UviXnC9FAyYpPjswE6jmMIr8wibZ74ngvl9V78sM
 f+aPx8Bim3+lyqYVasP5WTuOazfRZzTXYj7VDFjf4tW1AWI76iCVlHYzpGFbig36MOxe
 +VHs2IGvBBtxxMupcow3KliOiOzdybXp5MlpgKUvny2cNC1+GrZwtwJxvvNtDmZLqAxk
 gDcA==
X-Gm-Message-State: AOAM531WzKD/sE1U0VAaxzRWZdK56yBXkbQAn6DsHhjz0VJ29nth3pni
 4BWXkEV/O+keL/syzluDdX+popNjj/RsvNeFixWsRArNgASCIbqPptMqEpoEmyHIo0jaVr3EdKg
 ChFf8FeWhya3wv8E=
X-Received: by 2002:a17:906:3105:: with SMTP id 5mr965068ejx.168.1612374111603; 
 Wed, 03 Feb 2021 09:41:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzOUZ7YVqLNqMUuO80doLFSNNFzQGQ0pFVlNWnyzLh4VZuv8V4/wx2qnj2tWfI/jU6bZmIRUA==
X-Received: by 2002:a17:906:3105:: with SMTP id 5mr965057ejx.168.1612374111480; 
 Wed, 03 Feb 2021 09:41:51 -0800 (PST)
Received: from [192.168.1.36] (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id o11sm1220185eds.19.2021.02.03.09.41.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 09:41:50 -0800 (PST)
Subject: Re: [PATCH 03/22] Acceptance Tests: remove unnecessary tag from
 documentation example
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
References: <20210203172357.1422425-1-crosa@redhat.com>
 <20210203172357.1422425-4-crosa@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1c6da9ba-2914-d44f-e48a-be2d035718e4@redhat.com>
Date: Wed, 3 Feb 2021 18:41:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210203172357.1422425-4-crosa@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.178, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Eric Auger <eauger@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/21 6:23 PM, Cleber Rosa wrote:
> The ":avocado: enable" is not necessary and was removed in 9531d26c,
> so let's remove from the docs.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  docs/devel/testing.rst | 3 ---
>  1 file changed, 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


