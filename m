Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B6731E34D
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 00:56:58 +0100 (CET)
Received: from localhost ([::1]:50680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCWgj-0001eZ-2V
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 18:56:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWRk-00016b-HA
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:41:28 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:34614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCWRh-0004lk-BL
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 18:41:28 -0500
Received: by mail-pg1-x531.google.com with SMTP id o7so3709pgl.1
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 15:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RQJo3a2YquNCgK0VXq81wl7cHG+zRnkr9mYcghGogZQ=;
 b=qFlYh0RNWmw7tJkOHltvQWkAg00PBUly9yGKv4RxFFfHyH8B6Oo28ODTeAF1Za9ryC
 61OT2GFyBIsOpgZm0T+lsWJ+pXXQKqlFzXdqLuFnAPhxJIFPV6IHMFC8Bf7oLDZKuPTN
 bMcXrKarvA+Kf3iInDrrlO0qBgiTjZGfP2Jif9+MRM/tIFUYNPpJzXBfKgqZ/39j9PJC
 8OWj/QXZ9PETYvipUFYv627ai2hgBZR/7PyK0TrXbWbkCTst82L5kyf6h7cAIKErehIX
 EA8nIxPQsZcE6Lt+5m9L70r4ydw3Qwljv2S1FogUEvneoZXydgFVeR/wTqwi6ldzxTuF
 s/Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RQJo3a2YquNCgK0VXq81wl7cHG+zRnkr9mYcghGogZQ=;
 b=JB5lWA7Vgo0e/AUT91WDz/nsNPISEZ7yYiuB52PBB8bOfk6xUhSQWqIsPrOWl5cZ5g
 OXG7EJoFcxO79C6Kfo+An/nMjEljIE2dlguCjR71EgGg6t5P9F40q0JArTyfXZ1Yu0rK
 eigX2zQutfMQjNJPtzO2GSWXHNt63sitUKXL1o1htJvVEJ4gjdF/uPYDAulqeBQkAqMz
 NF8s/wV+u+bcaB8mcno+T2Z9dkjj7kcDwlMF+q4bvfmzYVtCaFyytTnBFer8LE0JcdU5
 Mnz/gansUA+oTnixJsV2MN6FnyXubprrWhVPXStMjb62zbgWmQqMH66ZbIjwKTRSmAcS
 xWcg==
X-Gm-Message-State: AOAM530nnw6JkFbDpAOoOb/2e7AFS4PksxoleBlpDGhOTX7nbWlXBuEG
 XW1suvjcv2PSfi5RioaojMIzCMNLh2o+ug==
X-Google-Smtp-Source: ABdhPJxhajJ83jVS58dOM9OnIxv8I1qMqLWC3dTUWWCB5RQH1VzzexnUC+paRRyj5llt0/UILVAMoA==
X-Received: by 2002:a05:6a00:1a03:b029:1d3:1fa3:4a5d with SMTP id
 g3-20020a056a001a03b02901d31fa34a5dmr1612869pfv.1.1613605283763; 
 Wed, 17 Feb 2021 15:41:23 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id c21sm3950355pgh.0.2021.02.17.15.41.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 15:41:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/35] Hexagon (target/hexagon) generater phase 4 - decode tree
Date: Wed, 17 Feb 2021 15:40:11 -0800
Message-Id: <20210217234023.1742406-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217234023.1742406-1-richard.henderson@linaro.org>
References: <20210217234023.1742406-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Taylor Simpson <tsimpson@quicinc.com>

Python script that emits the decode tree in dectree_generated.h.

Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <1612763186-18161-23-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/dectree.py | 351 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 351 insertions(+)
 create mode 100755 target/hexagon/dectree.py

diff --git a/target/hexagon/dectree.py b/target/hexagon/dectree.py
new file mode 100755
index 0000000000..29467ec7d7
--- /dev/null
+++ b/target/hexagon/dectree.py
@@ -0,0 +1,351 @@
+#!/usr/bin/env python3
+
+##
+##  Copyright(c) 2019-2021 Qualcomm Innovation Center, Inc. All Rights Reserved.
+##
+##  This program is free software; you can redistribute it and/or modify
+##  it under the terms of the GNU General Public License as published by
+##  the Free Software Foundation; either version 2 of the License, or
+##  (at your option) any later version.
+##
+##  This program is distributed in the hope that it will be useful,
+##  but WITHOUT ANY WARRANTY; without even the implied warranty of
+##  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+##  GNU General Public License for more details.
+##
+##  You should have received a copy of the GNU General Public License
+##  along with this program; if not, see <http://www.gnu.org/licenses/>.
+##
+
+import io
+import re
+
+import sys
+import iset
+
+encs = {tag : ''.join(reversed(iset.iset[tag]['enc'].replace(' ', '')))
+    for tag in iset.tags if iset.iset[tag]['enc'] != 'MISSING ENCODING'}
+
+enc_classes = set([iset.iset[tag]['enc_class'] for tag in encs.keys()])
+subinsn_enc_classes = \
+    set([enc_class for enc_class in enc_classes \
+        if enc_class.startswith('SUBINSN_')])
+ext_enc_classes = \
+    set([enc_class for enc_class in enc_classes \
+        if enc_class not in ('NORMAL', '16BIT') and \
+           not enc_class.startswith('SUBINSN_')])
+
+try:
+    subinsn_groupings = iset.subinsn_groupings
+except AttributeError:
+    subinsn_groupings = {}
+
+for (tag, subinsn_grouping) in subinsn_groupings.items():
+    encs[tag] = ''.join(reversed(subinsn_grouping['enc'].replace(' ', '')))
+
+dectree_normal = {'leaves' : set()}
+dectree_16bit = {'leaves' : set()}
+dectree_subinsn_groupings = {'leaves' : set()}
+dectree_subinsns = {name : {'leaves' : set()} for name in subinsn_enc_classes}
+dectree_extensions = {name : {'leaves' : set()} for name in ext_enc_classes}
+
+for tag in encs.keys():
+    if tag in subinsn_groupings:
+        dectree_subinsn_groupings['leaves'].add(tag)
+        continue
+    enc_class = iset.iset[tag]['enc_class']
+    if enc_class.startswith('SUBINSN_'):
+        if len(encs[tag]) != 32:
+            encs[tag] = encs[tag] + '0' * (32 - len(encs[tag]))
+        dectree_subinsns[enc_class]['leaves'].add(tag)
+    elif  enc_class == '16BIT':
+        if len(encs[tag]) != 16:
+            raise Exception('Tag "{}" has enc_class "{}" and not an encoding ' +
+                            'width of 16 bits!'.format(tag, enc_class))
+        dectree_16bit['leaves'].add(tag)
+    else:
+        if len(encs[tag]) != 32:
+            raise Exception('Tag "{}" has enc_class "{}" and not an encoding ' +
+                            'width of 32 bits!'.format(tag, enc_class))
+        if enc_class == 'NORMAL':
+            dectree_normal['leaves'].add(tag)
+        else:
+            dectree_extensions[enc_class]['leaves'].add(tag)
+
+faketags = set()
+for (tag, enc) in iset.enc_ext_spaces.items():
+    faketags.add(tag)
+    encs[tag] = ''.join(reversed(enc.replace(' ', '')))
+    dectree_normal['leaves'].add(tag)
+
+faketags |= set(subinsn_groupings.keys())
+
+def every_bit_counts(bitset):
+    for i in range(1, len(next(iter(bitset)))):
+        if len(set([bits[:i] + bits[i+1:] for bits in bitset])) == len(bitset):
+            return False
+    return True
+
+def auto_separate(node):
+    tags = node['leaves']
+    if len(tags) <= 1:
+        return
+    enc_width = len(encs[next(iter(tags))])
+    opcode_bit_for_all = \
+        [all([encs[tag][i] in '01' \
+            for tag in tags]) for i in range(enc_width)]
+    opcode_bit_is_0_for_all = \
+        [opcode_bit_for_all[i] and all([encs[tag][i] == '0' \
+            for tag in tags]) for i in range(enc_width)]
+    opcode_bit_is_1_for_all = \
+        [opcode_bit_for_all[i] and all([encs[tag][i] == '1' \
+            for tag in tags]) for i in range(enc_width)]
+    differentiator_opcode_bit = \
+        [opcode_bit_for_all[i] and \
+         not (opcode_bit_is_0_for_all[i] or \
+         opcode_bit_is_1_for_all[i]) \
+            for i in range(enc_width)]
+    best_width = 0
+    for width in range(4, 0, -1):
+        for lsb in range(enc_width - width, -1, -1):
+            bitset = set([encs[tag][lsb:lsb+width] for tag in tags])
+            if all(differentiator_opcode_bit[lsb:lsb+width]) and \
+                (len(bitset) == len(tags) or every_bit_counts(bitset)):
+                best_width = width
+                best_lsb = lsb
+                caught_all_tags = len(bitset) == len(tags)
+                break
+        if best_width != 0:
+            break
+    if best_width == 0:
+        raise Exception('Could not find a way to differentiate the encodings ' +
+                         'of the following tags:\n{}'.format('\n'.join(tags)))
+    if caught_all_tags:
+        for width in range(1, best_width):
+            for lsb in range(enc_width - width, -1, -1):
+                bitset = set([encs[tag][lsb:lsb+width] for tag in tags])
+                if all(differentiator_opcode_bit[lsb:lsb+width]) and \
+                    len(bitset) == len(tags):
+                    best_width = width
+                    best_lsb = lsb
+                    break
+            else:
+                continue
+            break
+    node['separator_lsb'] = best_lsb
+    node['separator_width'] = best_width
+    node['children'] = []
+    for value in range(2 ** best_width):
+        child = {}
+        bits = ''.join(reversed('{:0{}b}'.format(value, best_width)))
+        child['leaves'] = \
+            set([tag for tag in tags \
+                if encs[tag][best_lsb:best_lsb+best_width] == bits])
+        node['children'].append(child)
+    for child in node['children']:
+        auto_separate(child)
+
+auto_separate(dectree_normal)
+auto_separate(dectree_16bit)
+if subinsn_groupings:
+    auto_separate(dectree_subinsn_groupings)
+for dectree_subinsn in dectree_subinsns.values():
+    auto_separate(dectree_subinsn)
+for dectree_ext in dectree_extensions.values():
+    auto_separate(dectree_ext)
+
+for tag in faketags:
+    del encs[tag]
+
+def table_name(parents, node):
+    path = parents + [node]
+    root = path[0]
+    tag = next(iter(node['leaves']))
+    if tag in subinsn_groupings:
+        enc_width = len(subinsn_groupings[tag]['enc'].replace(' ', ''))
+    else:
+        tag = next(iter(node['leaves'] - faketags))
+        enc_width = len(encs[tag])
+    determining_bits = ['_'] * enc_width
+    for (parent, child) in zip(path[:-1], path[1:]):
+        lsb = parent['separator_lsb']
+        width = parent['separator_width']
+        value = parent['children'].index(child)
+        determining_bits[lsb:lsb+width] = \
+            list(reversed('{:0{}b}'.format(value, width)))
+    if tag in subinsn_groupings:
+        name = 'DECODE_ROOT_EE'
+    else:
+        enc_class = iset.iset[tag]['enc_class']
+        if enc_class in ext_enc_classes:
+            name = 'DECODE_EXT_{}'.format(enc_class)
+        elif enc_class in subinsn_enc_classes:
+            name = 'DECODE_SUBINSN_{}'.format(enc_class)
+        else:
+            name = 'DECODE_ROOT_{}'.format(enc_width)
+    if node != root:
+        name += '_' + ''.join(reversed(determining_bits))
+    return name
+
+def print_node(f, node, parents):
+    if len(node['leaves']) <= 1:
+        return
+    name = table_name(parents, node)
+    lsb = node['separator_lsb']
+    width = node['separator_width']
+    print('DECODE_NEW_TABLE({},{},DECODE_SEPARATOR_BITS({},{}))'.\
+        format(name, 2 ** width, lsb, width), file=f)
+    for child in node['children']:
+        if len(child['leaves']) == 0:
+            print('INVALID()', file=f)
+        elif len(child['leaves']) == 1:
+            (tag,) = child['leaves']
+            if tag in subinsn_groupings:
+                class_a = subinsn_groupings[tag]['class_a']
+                class_b = subinsn_groupings[tag]['class_b']
+                enc = subinsn_groupings[tag]['enc'].replace(' ', '')
+                if 'RESERVED' in tag:
+                    print('INVALID()', file=f)
+                else:
+                    print('SUBINSNS({},{},{},"{}")'.\
+                        format(tag, class_a, class_b, enc), file=f)
+            elif tag in iset.enc_ext_spaces:
+                enc = iset.enc_ext_spaces[tag].replace(' ', '')
+                print('EXTSPACE({},"{}")'.format(tag, enc), file=f)
+            else:
+                enc = ''.join(reversed(encs[tag]))
+                print('TERMINAL({},"{}")'.format(tag, enc), file=f)
+        else:
+            print('TABLE_LINK({})'.format(table_name(parents + [node], child)),
+                  file=f)
+    print('DECODE_END_TABLE({},{},DECODE_SEPARATOR_BITS({},{}))'.\
+        format(name, 2 ** width, lsb, width), file=f)
+    print(file=f)
+    parents.append(node)
+    for child in node['children']:
+        print_node(f, child, parents)
+    parents.pop()
+
+def print_tree(f, tree):
+    print_node(f, tree, [])
+
+def print_match_info(f):
+    for tag in sorted(encs.keys(), key=iset.tags.index):
+        enc = ''.join(reversed(encs[tag]))
+        mask = int(re.sub(r'[^1]', r'0', enc.replace('0', '1')), 2)
+        match = int(re.sub(r'[^01]', r'0', enc), 2)
+        suffix = ''
+        print('DECODE{}_MATCH_INFO({},0x{:x}U,0x{:x}U)'.\
+            format(suffix, tag, mask, match), file=f)
+
+regre = re.compile(
+    r'((?<!DUP)[MNORCPQXSGVZA])([stuvwxyzdefg]+)([.]?[LlHh]?)(\d+S?)')
+immre = re.compile(r'[#]([rRsSuUm])(\d+)(?:[:](\d+))?')
+
+def ordered_unique(l):
+    return sorted(set(l), key=l.index)
+
+implicit_registers = {
+    'SP' : 29,
+    'FP' : 30,
+    'LR' : 31
+}
+
+num_registers = {
+    'R' : 32,
+    'V' : 32
+}
+
+def print_op_info(f):
+    for tag in sorted(encs.keys(), key=iset.tags.index):
+        enc = encs[tag]
+        print(file=f)
+        print('DECODE_OPINFO({},'.format(tag), file=f)
+        regs = ordered_unique(regre.findall(iset.iset[tag]['syntax']))
+        imms = ordered_unique(immre.findall(iset.iset[tag]['syntax']))
+        regno = 0
+        for reg in regs:
+            reg_type = reg[0]
+            reg_letter = reg[1][0]
+            reg_num_choices = int(reg[3].rstrip('S'))
+            reg_mapping = reg[0] + ''.join(['_' for letter in reg[1]]) + reg[3]
+            reg_enc_fields = re.findall(reg_letter + '+', enc)
+            if len(reg_enc_fields) == 0:
+                raise Exception('Tag "{}" missing register field!'.format(tag))
+            if len(reg_enc_fields) > 1:
+                raise Exception('Tag "{}" has split register field!'.\
+                    format(tag))
+            reg_enc_field = reg_enc_fields[0]
+            if 2 ** len(reg_enc_field) != reg_num_choices:
+                raise Exception('Tag "{}" has incorrect register field width!'.\
+                    format(tag))
+            print('        DECODE_REG({},{},{})'.\
+                format(regno, len(reg_enc_field), enc.index(reg_enc_field)),
+                       file=f)
+            if reg_type in num_registers and \
+                reg_num_choices != num_registers[reg_type]:
+                print('        DECODE_MAPPED_REG({},{})'.\
+                    format(regno, reg_mapping), file=f)
+            regno += 1
+        def implicit_register_key(reg):
+            return implicit_registers[reg]
+        for reg in sorted(
+            set([r for r in (iset.iset[tag]['rregs'].split(',') + \
+                iset.iset[tag]['wregs'].split(',')) \
+                    if r in implicit_registers]), key=implicit_register_key):
+            print('        DECODE_IMPL_REG({},{})'.\
+                format(regno, implicit_registers[reg]), file=f)
+            regno += 1
+        if imms and imms[0][0].isupper():
+            imms = reversed(imms)
+        for imm in imms:
+            if imm[0].isupper():
+                immno = 1
+            else:
+                immno = 0
+            imm_type = imm[0]
+            imm_width = int(imm[1])
+            imm_shift = imm[2]
+            if imm_shift:
+                imm_shift = int(imm_shift)
+            else:
+                imm_shift = 0
+            if imm_type.islower():
+                imm_letter = 'i'
+            else:
+                imm_letter = 'I'
+            remainder = imm_width
+            for m in reversed(list(re.finditer(imm_letter + '+', enc))):
+                remainder -= m.end() - m.start()
+                print('        DECODE_IMM({},{},{},{})'.\
+                    format(immno, m.end() - m.start(), m.start(), remainder),
+                        file=f)
+            if remainder != 0:
+                if imm[2]:
+                    imm[2] = ':' + imm[2]
+                raise Exception('Tag "{}" has an incorrect number of ' + \
+                    'encoding bits for immediate "{}"'.\
+                    format(tag, ''.join(imm)))
+            if imm_type.lower() in 'sr':
+                print('        DECODE_IMM_SXT({},{})'.\
+                    format(immno, imm_width), file=f)
+            if imm_type.lower() == 'n':
+                print('        DECODE_IMM_NEG({},{})'.\
+                    format(immno, imm_width), file=f)
+            if imm_shift:
+                print('        DECODE_IMM_SHIFT({},{})'.\
+                    format(immno, imm_shift), file=f)
+        print(')', file=f)
+
+if __name__ == '__main__':
+    with open(sys.argv[1], 'w') as f:
+        print_tree(f, dectree_normal)
+        print_tree(f, dectree_16bit)
+        if subinsn_groupings:
+            print_tree(f, dectree_subinsn_groupings)
+        for (name, dectree_subinsn) in sorted(dectree_subinsns.items()):
+            print_tree(f, dectree_subinsn)
+        for (name, dectree_ext) in sorted(dectree_extensions.items()):
+            print_tree(f, dectree_ext)
+        print_match_info(f)
+        print_op_info(f)
-- 
2.25.1


