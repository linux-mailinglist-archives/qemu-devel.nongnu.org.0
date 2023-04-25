Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8DF6EE755
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 20:06:21 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prN3B-00031H-Aw; Tue, 25 Apr 2023 14:06:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1prN36-00030T-OY
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 14:05:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1prN35-0005Qn-9D
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 14:05:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682445954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kzI3s0+w7AnBCWRapIJORBuHVL45gQrLmySiZRhftEM=;
 b=dygD8sOPFBeNEJlYhDB30NCcqz7oITyBPAIOM2VjpGwTH78H87cAUqr7X5AA+tfBCwageV
 BDUstQUq8SaJ14r88iQr3528nuSHusXo3OylqNlYmpGBOgnOTFqtwVs4UXlqLddA3ykQFW
 Z6FVarr4FTVqioRE+t+WO2MDcb5A5W0=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-265-_zx_RI7XPGa8lZj_D69dfQ-1; Tue, 25 Apr 2023 14:05:52 -0400
X-MC-Unique: _zx_RI7XPGa8lZj_D69dfQ-1
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-3ef3116d1dcso15673351cf.1
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 11:05:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682445952; x=1685037952;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kzI3s0+w7AnBCWRapIJORBuHVL45gQrLmySiZRhftEM=;
 b=L/dqi6NLbAQCoYTyk1oE0M4NHIyK12HRdqzinZA22Lx5UCVTKpj+LgTZWRDUbiO/SC
 Hl84KT4Abb6qvrfPjiYHfkD6q9LATbb80WQLDVn0Y5KhVbEHidsMeQfg3+5fgrvouMzn
 YkjQtknOByak5HkyUJEnjC769EK8/gQQhyV7D8CP4vDJu4VBKHtwgiIwV3wHCzc90d+7
 rjAtJJNF7+viA2lnt9yc/D73WXHI0LRzvCDlOxOelO3uaKvdZYQL+4pIBclJT/4jEFcF
 Hnge9m76Wk8G/CQIIvJU40sOHXF/tFqdX5wofAUVnDq86ZPIGPRlk15D/JFSFuw/1jd1
 zPgg==
X-Gm-Message-State: AAQBX9fgvrHx/jWXkDvPJGbFDMjcyNdje6XIEfWd3FFTcaITP7M/4fTP
 nRR2vB/3rkNkJKTlfx51WqAo8nl87ZbfwfaTw+pJbTtmTzwEFBQBvGb4zECy7zWkguVqBZ/2n9A
 t0vxJbo6tmlpoTimkQOr4OjrEEZ/rNCn4+BUAsBla4VDyK1cs2Wz26FNqybQG5msto2/BMbGV
X-Received: by 2002:ac8:5c49:0:b0:3ef:3912:ab3e with SMTP id
 j9-20020ac85c49000000b003ef3912ab3emr30965710qtj.2.1682445951768; 
 Tue, 25 Apr 2023 11:05:51 -0700 (PDT)
X-Google-Smtp-Source: AKy350asHXxZDKpo9tj0QQsDbtbXVrdzx6Lx3BztIr+k6cpHX/JjfHHBMSQNiERgO+zadPqqG7wK4A==
X-Received: by 2002:ac8:5c49:0:b0:3ef:3912:ab3e with SMTP id
 j9-20020ac85c49000000b003ef3912ab3emr30965662qtj.2.1682445951360; 
 Tue, 25 Apr 2023 11:05:51 -0700 (PDT)
Received: from x1n.redhat.com
 (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca. [70.52.229.124])
 by smtp.gmail.com with ESMTPSA id
 b17-20020a05620a271100b0074e034915d4sm4552297qkp.73.2023.04.25.11.05.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 11:05:49 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: peterx@redhat.com, Juan Quintela <quintela@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Subject: [PATCH 2/2] vmstate-static-checker: Recognize "num" field
Date: Tue, 25 Apr 2023 14:05:44 -0400
Message-Id: <20230425180544.1815888-3-peterx@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230425180544.1815888-1-peterx@redhat.com>
References: <20230425180544.1815888-1-peterx@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Recognize this field for VMS_ARRAY typed vmsd fields, then we can do proper
size matching with previous patch.

Note that this is compatible with old -dump-vmstate output, because when
"num" is not there we'll still use the old "size" only.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 scripts/vmstate-static-checker.py | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/scripts/vmstate-static-checker.py b/scripts/vmstate-static-checker.py
index dfeee8231a..9c0e6b81f2 100755
--- a/scripts/vmstate-static-checker.py
+++ b/scripts/vmstate-static-checker.py
@@ -134,6 +134,11 @@ def exists_in_substruct(fields, item):
     return check_fields_match(fields["Description"]["name"],
                               substruct_fields[0]["field"], item)
 
+def size_total(entry):
+    size = entry["size"]
+    if "num" not in entry:
+        return size
+    return size * entry["num"]
 
 def check_fields(src_fields, dest_fields, desc, sec):
     # This function checks for all the fields in a section.  If some
@@ -249,17 +254,19 @@ def check_fields(src_fields, dest_fields, desc, sec):
                 continue
 
             if s_item["field"] == "unused" or d_item["field"] == "unused":
-                if s_item["size"] == d_item["size"]:
+                s_size = size_total(s_item)
+                d_size = size_total(d_item)
+                if s_size == d_size:
                     continue
 
                 if d_item["field"] == "unused":
                     advance_dest = False
-                    unused_count = d_item["size"] - s_item["size"]
+                    unused_count = d_size - s_size;
                     continue
 
                 if s_item["field"] == "unused":
                     advance_src = False
-                    unused_count = s_item["size"] - d_item["size"]
+                    unused_count = s_size - d_size
                     continue
 
             print("Section \"" + sec + "\",", end=' ')
-- 
2.39.1


