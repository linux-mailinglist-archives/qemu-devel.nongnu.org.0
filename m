Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC0D4B8FEC
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 19:11:01 +0100 (CET)
Received: from localhost ([::1]:57422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKOlY-0004Zi-FF
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 13:11:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nKOGW-0001FO-38
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 12:38:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nKOGU-0008OC-2P
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 12:38:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645033133;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E9TqS6nnItwKgT7XvTnI9r+vyA1977KaU9t/c0BsZqc=;
 b=SFfTuzQfiFJCO1G169I0PKVFeiKtg0BTZcfB6SQN9upOB/R1sqLiVR+SBFC+1gBOnUnxXk
 AMe8wM0XxQ8BswykIOWWjhrajvK2WLOd7Zua8wzbJxZw3vokS9Qd9NeJJDkU3Uts9Mc8Xc
 6QdTGuZBgXFHuGZ1q1soIi4KfqWPFkM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-382-OLpE8aJSOe2VHDGu9OdZdQ-1; Wed, 16 Feb 2022 12:38:49 -0500
X-MC-Unique: OLpE8aJSOe2VHDGu9OdZdQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 22-20020a05600c229600b0037be079ebf6so467219wmf.9
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 09:38:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=E9TqS6nnItwKgT7XvTnI9r+vyA1977KaU9t/c0BsZqc=;
 b=s9X9duG9uXNDe0ebtdkGyPrtf0+Vlrneaei9ffQURugaoEpoLaKA4d3+OZMk6Fvo7P
 jsPMW3+k5CjEOmsXQjBjlokX9XWhzN/4qAHl8cSkhAXdwurcVidAkilbESUkQvjW5jX/
 nJEDhg9uVdR7rTsYo37fCr0YZAbpbtidleriu4xo8jMG2IvD1TrjZQW2sTHJvRzQj95G
 JVZ08VFyF9XauO1HRNwT5klcMMzj704KRY9m4b90sGrMTN5UIWhix2D5jrOcZDLrRScD
 yKFEPWgYNHKc1UIoQmsL3FS89ICYAEZjkZNNFbNgIkDQIFxc2hAy1WWDa7WRTErXw8fc
 +mnw==
X-Gm-Message-State: AOAM5316BXdjLj+62Y1FlqZ+lAXR4JavcTJxgAss3937Oy5Fh4nSp8X8
 yx13XS7obBFdBVOj6bib+r4SQrCWg7Fvq9TjwGKqev9s0UAzSeUF6jcfzF4AUw0yKm54SLAL4GK
 nOvZVUnOeLbt9bt0=
X-Received: by 2002:a1c:2782:0:b0:37c:2d45:a52f with SMTP id
 n124-20020a1c2782000000b0037c2d45a52fmr2691676wmn.17.1645033128100; 
 Wed, 16 Feb 2022 09:38:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJykYtiVOJy4zTFVB+q7dM/aKX3PJxrLTDeynGFR69Tj7jybWkx83UDMqPQY97e0MFBXtq6BcQ==
X-Received: by 2002:a1c:2782:0:b0:37c:2d45:a52f with SMTP id
 n124-20020a1c2782000000b0037c2d45a52fmr2691670wmn.17.1645033127933; 
 Wed, 16 Feb 2022 09:38:47 -0800 (PST)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218])
 by smtp.gmail.com with ESMTPSA id v8sm12467547wrf.115.2022.02.16.09.38.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 09:38:47 -0800 (PST)
Message-ID: <f25b9d08-bb73-31a6-e5e1-d28cc249ff85@redhat.com>
Date: Wed, 16 Feb 2022 18:38:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [qemu-web PATCH] Announce Outreachy 2022 May-August
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20220215134612.41736-1-stefanha@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220215134612.41736-1-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/02/2022 14.46, Stefan Hajnoczi wrote:
> Add a blog post inviting Outreachy applicants. QEMU has funding to
> participate in the Outreachy internship program
> (https://www.outreachy.org/) again this summer. We need to let people
> know about this so we get applicants!

Thanks, pushed now!

  Thomas


