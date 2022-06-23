Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B033A557E66
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 17:02:53 +0200 (CEST)
Received: from localhost ([::1]:43624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4OM8-0004ER-Qo
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 11:02:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o4OIt-00025G-0q
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 10:59:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o4OIp-000455-2T
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 10:59:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655996366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wGM1FiFKajnQ1Inq3xrWaiPjcLjInqvFS8SAdPISj2Y=;
 b=gvD8XLFH8sxNlGgLIXGzzQGZFjfgAiSMVjKPe4h+fGEyxTX1lJsVYA+DdEvo1FXNr/K+Gk
 PSD74M7fB07e4hA6lko0XjXCzf2XznMBUJy0FBiv7rpxnvpzaGiIQKPJ09XtkP01DvLLlq
 b4iDY6v1CNaSF2IeUGUrEMvGmxlALSI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-402-Y47fDm7sNV-sle4bQRtVUA-1; Thu, 23 Jun 2022 10:59:24 -0400
X-MC-Unique: Y47fDm7sNV-sle4bQRtVUA-1
Received: by mail-wm1-f69.google.com with SMTP id
 ay13-20020a05600c1e0d00b003a03347d9afso355757wmb.8
 for <qemu-devel@nongnu.org>; Thu, 23 Jun 2022 07:59:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wGM1FiFKajnQ1Inq3xrWaiPjcLjInqvFS8SAdPISj2Y=;
 b=CGp84CrGZSWeL01x6fypqGzTJtuHeuJF3ptaStxYUD3p3jhT5gDrxOCqQ0I+6G9aV2
 IFNpj8kOCsXxUdTEQBNjg86ESNQx3WPwH7TuHA8qMBUoC28TvYYKhPFS0Ucp5HZMkhaY
 gyi8gz3SP/uknqHSUnkRVs5v3ynlvdGWqQh5b4g2KSlTVuqAfddUU+Fr10426R+6UPF2
 SKGNf1/CNA+iOjz94tsCGf8uWp9+drYUY/+AYiIy+Fps+hgmeaxDFykwdZnPA7ggRl9Z
 1QfcH79QBTOLPAxR2lQF+0BsWIaBydaPdjjnnQGTVaMT8dWShf1bfJNOHg8PwlQURSz3
 8x7g==
X-Gm-Message-State: AJIora9+3XVvpxTfFBgx7iqNH2tyoN5Wu77TOw0njxVhQAdTpDOVS7fp
 jjv+reVzzO3QYx/WrZiriAzEf1h5jTlbl8RhWS6KKNw/n7t/10gOiWG2FIuUabtRaqt1DVu9+Bo
 1mg5VPUX/l0FFF28=
X-Received: by 2002:a05:600c:3503:b0:39c:65e0:c070 with SMTP id
 h3-20020a05600c350300b0039c65e0c070mr4617854wmq.161.1655996363217; 
 Thu, 23 Jun 2022 07:59:23 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u6mke0X96/A02tr+OkIM3ngNed0ifBr8Io4HGZLTJFID1XD7xhoVCnfqudZmxur7Y7Xh143A==
X-Received: by 2002:a05:600c:3503:b0:39c:65e0:c070 with SMTP id
 h3-20020a05600c350300b0039c65e0c070mr4617841wmq.161.1655996363032; 
 Thu, 23 Jun 2022 07:59:23 -0700 (PDT)
Received: from [192.168.8.104] (tmo-098-39.customers.d1-online.com.
 [80.187.98.39]) by smtp.gmail.com with ESMTPSA id
 bs27-20020a056000071b00b0021b932de5d6sm4584342wrb.39.2022.06.23.07.59.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jun 2022 07:59:22 -0700 (PDT)
Message-ID: <51e36301-d056-85bf-447a-2d0b9e6ad251@redhat.com>
Date: Thu, 23 Jun 2022 16:59:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [Qemu-devel] [PATCH] gtk: Add show_tabs=on|off command line
 option.
Content-Language: en-US
To: =?UTF-8?Q?Felix_Quei=c3=9fner?= <qemu-devel@mq32.de>, qemu-devel@nongnu.org
Cc: kraxel@redhat.com, Igor Sudarikov <4seev3@gmail.com>
References: <56D0203F.5060303@gmail.com>
 <b95df229-3cb9-1646-e7fd-c68ad4f03bfd@mailbox.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <b95df229-3cb9-1646-e7fd-c68ad4f03bfd@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/06/2022 16.36, Felix Queißner wrote:
> Heya!
> 
>> The patch adds "show_tabs" command line option for GTK ui similar to 
>> "grab_on_hover". This option allows tabbed view mode to not have to be 
>> enabled by hand at each start of the VM.
> 
> It's been a while now, but i was always missing this feature in QEMU and i'd 
> love to see that patch land in QEMU one day.
> 
> I discovered that patch by searching for "start qemu with tabs visible" and 
> found this link:
> 
> https://patchwork.ozlabs.org/project/qemu-devel/patch/56D0203F.5060303@gmail.com/ 

Not sure why it was

That patch certainly needs a re-spin since it won't apply as-is anymore. 
Want to have a try?

  Thomas


