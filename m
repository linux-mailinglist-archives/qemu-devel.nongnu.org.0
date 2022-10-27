Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A33AB60F124
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 09:31:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onxGY-0003O3-Dg; Thu, 27 Oct 2022 03:25:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1onxGW-0003Nw-OH
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 03:25:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1onxGV-0002jN-7d
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 03:25:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666855522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hhWNumegodfjdTxY74Ndfe/GPySpVKg872mCr4kE29s=;
 b=hEstui4FJ+7CPawYkAdD569W343LjabQVy8T2u9NGAxzAvxTR8Q7EGswhwZ4HWWtUeupVr
 jDDqMxsolS3lsJzRI3q6pfwopNyx8smerijAUfUgdRpnHD9kJQpOXsVL0M877Guh8RKctW
 ED7Rj5uSQifnXq/F/pafntd0Q0gNDEM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-644-tBhJzll4Nca7VQmS_ebP4Q-1; Thu, 27 Oct 2022 03:25:19 -0400
X-MC-Unique: tBhJzll4Nca7VQmS_ebP4Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 r81-20020a1c4454000000b003c41e9ae97dso2370757wma.6
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 00:25:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hhWNumegodfjdTxY74Ndfe/GPySpVKg872mCr4kE29s=;
 b=ktVQ8+dpa73ysf8IQ1angZokAHKxj87tBpiQ0zh9/UzAwFT4oWO+eMT7qunjvzTNTU
 3Lhul51awDqEPQTENFKeqCbF4G6vcr8Puu0cfE5nOM8CAVRSFkSOK8iNTyXMZbS2Xnxc
 2qJA7xiIyYjnpwL7BPLiQQUqLM6wsDtsOtW+1O3VesNVETbLScipkxMiL2gUb1tmaabn
 Sz8EtZnhne3FhpTyvW7umI0x49cXLSt1sapjUYd49KGQ9pgyefA7fjnUcjIyrF81gUQh
 8ofw4MY/v2bM/VB7LsTmOZlQ+D2+xz2FJhSVP2GkLCaaRN2hvZUSdDFl8vHmY8aGktne
 ibhA==
X-Gm-Message-State: ACrzQf04Gmm6oQTTrqriMIMr+qn+sn8qm5v5SzBnxqCwpuETPpiwZa0U
 th1yejy3Zpp7tEDTInbKbN9QFpXjk5fIosoBLoc76e1DWHk8Cz6bdhzJ+Njv2Uhp3oyYt/ztbQ9
 aagKJmLbB6rppiyE=
X-Received: by 2002:a05:6000:699:b0:236:65a9:91b7 with SMTP id
 bo25-20020a056000069900b0023665a991b7mr16477366wrb.591.1666855518682; 
 Thu, 27 Oct 2022 00:25:18 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7Ii9PJOwm9Tnua7QAxvrWPnlaS555KlSRoJYBIheJO6pDrlrUAmGHiG55WuZYUjBhPYSO6iA==
X-Received: by 2002:a05:6000:699:b0:236:65a9:91b7 with SMTP id
 bo25-20020a056000069900b0023665a991b7mr16477342wrb.591.1666855518472; 
 Thu, 27 Oct 2022 00:25:18 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-176-195.web.vodafone.de.
 [109.43.176.195]) by smtp.gmail.com with ESMTPSA id
 l9-20020a1c7909000000b003cf4006a9casm669434wme.39.2022.10.27.00.25.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 00:25:17 -0700 (PDT)
Message-ID: <153a2c4f-6300-8570-f60e-c54503914726@redhat.com>
Date: Thu, 27 Oct 2022 09:25:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Stefan Pejic <stefan.pejic@syrmia.com>
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com, Milica Lazarevic
 <milica.lazarevic@syrmia.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20220912122635.74032-1-milica.lazarevic@syrmia.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v3 0/24] Convert nanoMIPS disassembler from C++ to C
In-Reply-To: <20220912122635.74032-1-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/09/2022 14.26, Milica Lazarevic wrote:
> Hi,
> 
> This patchset converts the nanomips disassembler to plain C. C++ features
> like class, std::string type, exception handling, and function overloading
> have been removed and replaced with the equivalent C code.

  Hi Philippe, hi Stefan,

as far as I can see, this patch set has been completely reviewed, and IMHO 
it would be nice to get this into QEMU 7.2 to finally get rid of the C++ 
dependency in the QEMU code ... could one of you pick this up and send a 
pull request with the patches? Or is there still anything left to do here?

  Thomas


